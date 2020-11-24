 // wrap in UMD - see https://github.com/umdjs/umd/blob/master/jqueryPlugin.js
(function (factory) {
    if (typeof define === "function" && define.amd) {
        define(["jquery"], function ($) {
            factory($, window, document);
        });
    } else {
        factory(jQuery, window, document);
    }
})(function ($, window, document, undefined) {
    "use strict";
    var pluginName = "concodeSelect", id = 1, // give each instance its own ID for namespaced event handling
	defaults = {
	    // Default concode
	    defaultconcode: "",
	    // Position the selected flag inside or outside of the input
	    defaultStyling: "inside",
	    // Display only these countries
	    onlyCountries: [],
	    // The countries at the top of the list. Defaults to United States and United Kingdom
	    preferredconcodes: ["us", "gb"]
	}, keys = {
	    UP: 38,
	    DOWN: 40,
	    ENTER: 13,
	    ESC: 27,
	    PLUS: 43,
	    A: 65,
	    Z: 90
	}, windowLoaded = false;
    // keep track of if the window.load event has fired as impossible to check after the fact
    $(window).on('load', function () {
        windowLoaded = true;
    });
    function Plugin(element, options) {
        this.element = element;
        this.options = $.extend({}, defaults, options);
        this._defaults = defaults;
        // event namespace
        this.ns = "." + pluginName + id++;
        this._name = pluginName;
        this.init();
    }
    Plugin.prototype = {
        init: function () {
            // Process all the data: onlyCountries, preferredconcodes, defaultconcode etc
            this._processconcodeData();
            // Generate the markup
            this._generateMarkup();
            // Set the initial state of the input value and the selected flag
            this._setInitialState();
            // Start all of the event listeners: input keyup, selectedFlag click
            this._initListeners();
            // Return this when the auto concode is resolved.
            this.autoconcodeDeferred = new $.Deferred();
            // Get auto concode.
            this._initAutoconcode();

            return this.autoconcodeDeferred;
        },
		/********************
		 *  PRIVATE METHODS
		 ********************/
        // prepare all of the concode data, including onlyCountries, preferredconcodes and
        // defaultconcode options
        _processconcodeData: function () {
            // set the instances concode data objects
            this._setInstanceconcodeData();
            // set the preferredconcodes property
            this._setpreferredconcodes();
        },
        // process onlyCountries array if present
        _setInstanceconcodeData: function () {
            var that = this;
            if (this.options.onlyCountries.length) {
                var newCountries = [];
                $.each(this.options.onlyCountries, function (i, concodeCode) {
                    var concodeData = that._getconcodeData(concodeCode, true);
                    if (concodeData) {
                        newCountries.push(concodeData);
                    }
                });
                this.countries = newCountries;
            } else {
                this.countries = allCountries;
            }
        },
        // Process preferred countries - iterate through the preferences,
        // fetching the concode data for each one
        _setpreferredconcodes: function () {
            var that = this;
            this.preferredconcodes = [];
            $.each(this.options.preferredconcodes, function (i, concodeCode) {
                var concodeData = that._getconcodeData(concodeCode, false);
                if (concodeData) {
                    that.preferredconcodes.push(concodeData);
                }
            });
        },
        // generate all of the markup for the plugin: the selected flag overlay, and the dropdown
        _generateMarkup: function () {
            // concode input
            this.concodeInput = $(this.element);
            // containers (mostly for positioning)
            var mainClass = "concode-select";
            if (this.options.defaultStyling) {
                mainClass += " " + this.options.defaultStyling;
            }
            this.concodeInput.wrap($("<div>", {
                "class": mainClass
            }));
            var flagsContainer = $("<div>", {
                "class": "flag-dropdown"
            }).insertAfter(this.concodeInput);
            // currently selected flag (displayed to left of input)
            var selectedFlag = $("<div>", {
                "class": "selected-flag"
            }).appendTo(flagsContainer);
            this.selectedFlagInner = $("<div>", {
                "class": "flag"
            }).appendTo(selectedFlag);
            // CSS triangle
            $("<div>", {
                "class": "arrow"
            }).appendTo(this.selectedFlagInner);
            // concode list contains: preferred countries, then divider, then all countries
            this.concodeList = $("<ul>", {
                "class": "concode-list v-hide"
            }).appendTo(flagsContainer);
            if (this.preferredconcodes.length) {
                this._appendListItems(this.preferredconcodes, "preferred");
                $("<li>", {
                    "class": "divider"
                }).appendTo(this.concodeList);
            }
            this._appendListItems(this.countries, "");
            // Add the hidden input for the concode code
            this.concodeCodeInput = $("#" + this.concodeInput.attr("id") + "_code");
            if (!this.concodeCodeInput) {
                this.concodeCodeInput = $('<input type="hidden" id="' + this.concodeInput.attr("id") + '_code" name="' + this.concodeInput.attr("name") + '_code" value="" />');
                this.concodeCodeInput.insertAfter(this.concodeInput);
            }
            // now we can grab the dropdown height, and hide it properly
            this.dropdownHeight = this.concodeList.outerHeight();
            this.concodeList.removeClass("v-hide").addClass("hide");
            // this is useful in lots of places
            this.concodeListItems = this.concodeList.children(".concode");
        },
        // add a concode <li> to the concodeList <ul> container
        _appendListItems: function (countries, className) {
            // Generate DOM elements as a large temp string, so that there is only
            // one DOM insert event
            var tmp = "";
            // for each concode
            $.each(countries, function (i, c) {
                // open the list item
                tmp += '<li class="concode ' + className + '" data-concode-code="' + c.iso2 + '">';
                // add the flag
                tmp += '<div class="flag ' + c.iso2 + '"></div>';
                // and the concode name
                tmp += '<span class="concode-name">' + c.name + '</span>';
                // close the list item
                tmp += '</li>';
            });
            this.concodeList.append(tmp);
        },
        // set the initial state of the input value and the selected flag
        _setInitialState: function () {
            var flagIsSet = false;
            // If the input is pre-populated, then just update the selected flag
            if (this.concodeInput.val()) {
                flagIsSet = this._updateFlagFromInputVal();
            }
            // If the concode code input is pre-populated, update the name and the selected flag
            var selectedCode = this.concodeCodeInput.val();
            if (selectedCode) {
                this.selectconcode(selectedCode);
            }
            if (!flagIsSet) {
                // flag is not set, so set to the default concode
                var defaultconcode;
                // check the defaultconcode option, else fall back to the first in the list
                if (this.options.defaultconcode) {
                    defaultconcode = this._getconcodeData(this.options.defaultconcode, false);
                    // Did we not find the requested default concode?
                    if (!defaultconcode) {
                        defaultconcode = this.preferredconcodes.length ? this.preferredconcodes[0] : this.countries[0];
                    }
                } else {
                    defaultconcode = this.preferredconcodes.length ? this.preferredconcodes[0] : this.countries[0];
                }
                this.defaultconcode = defaultconcode.iso2;
            }
        },
        // initialise the main event listeners: input keyup, and click selected flag
        _initListeners: function () {
            var that = this;
            // Update flag on keyup.
            // Use keyup instead of keypress because we want to update on backspace
            // and instead of keydown because the value hasn't updated when that
            // event is fired.
            // NOTE: better to have this one listener all the time instead of
            // starting it on focus and stopping it on blur, because then you've
            // got two listeners (focus and blur)
            this.concodeInput.on("keyup" + this.ns, function () {
                that._updateFlagFromInputVal();
            });
            // toggle concode dropdown on click
            var selectedFlag = this.selectedFlagInner.parent();
            selectedFlag.on("click" + this.ns, function (e) {
                // only intercept this event if we're opening the dropdown
                // else let it bubble up to the top ("click-off-to-close" listener)
                // we cannot just stopPropagation as it may be needed to close another instance
                if (that.concodeList.hasClass("hide") && !that.concodeInput.prop("disabled")) {
                    that._showDropdown();
                }
            });
            // Despite above note, added blur to ensure partially spelled concode
            // with correctly chosen flag is spelled out on blur. Also, correctly
            // selects flag when field is autofilled
            this.concodeInput.on("blur" + this.ns, function () {
                if (that.concodeInput.val() != that.getSelectedconcodeData().name) {
                    that.setconcode(that.concodeInput.val());
                }
                that.concodeInput.val(that.getSelectedconcodeData().name);
            });
        },
        _initAutoconcode: function () {
            if (this.options.initialconcode === "auto") {
                this._loadAutoconcode();
            } else {
                this.selectconcode(this.defaultconcode);
                this.autoconcodeDeferred.resolve();
            }
        },
        // perform the geo ip lookup
        _loadAutoconcode: function () {
            var that = this;

            // 3 options:
            // 1) already loaded (we're done)
            // 2) not already started loading (start)
            // 3) already started loading (do nothing - just wait for loading callback to fire)
            if ($.fn[pluginName].autoconcode) {
                this.handleAutoconcode();
            } else if (!$.fn[pluginName].startedLoadingAutoconcode) {
                // don't do this twice!
                $.fn[pluginName].startedLoadingAutoconcode = true;

                if (typeof this.options.geoIpLookup === 'function') {
                    this.options.geoIpLookup(function (concodeCode) {
                        $.fn[pluginName].autoconcode = concodeCode.toLowerCase();
                        // tell all instances the auto concode is ready
                        // TODO: this should just be the current instances
                        // UPDATE: use setTimeout in case their geoIpLookup function calls this callback straight away (e.g. if they have already done the geo ip lookup somewhere else). Using setTimeout means that the current thread of execution will finish before executing this, which allows the plugin to finish initialising.
                        setTimeout(function () {
                            $(".concode-select input").concodeSelect("handleAutoconcode");
                        });
                    });
                }
            }
        },
        // Focus input and put the cursor at the end
        _focus: function () {
            this.concodeInput.focus();
            var input = this.concodeInput[0];
            // works for Chrome, FF, Safari, IE9+
            if (input.setSelectionRange) {
                var len = this.concodeInput.val().length;
                input.setSelectionRange(len, len);
            }
        },
        // Show the dropdown
        _showDropdown: function () {
            this._setDropdownPosition();
            // update highlighting and scroll to active list item
            var activeListItem = this.concodeList.children(".active");
            this._highlightListItem(activeListItem);
            // show it
            this.concodeList.removeClass("hide");
            this._scrollTo(activeListItem);
            // bind all the dropdown-related listeners: mouseover, click, click-off, keydown
            this._bindDropdownListeners();
            // update the arrow
            this.selectedFlagInner.children(".arrow").addClass("up");
        },
        // decide where to position dropdown (depends on position within viewport, and scroll)
        _setDropdownPosition: function () {
            var inputTop = this.concodeInput.offset().top, windowTop = $(window).scrollTop(),
			dropdownFitsBelow = inputTop + this.concodeInput.outerHeight() + this.dropdownHeight < windowTop + $(window).height(), dropdownFitsAbove = inputTop - this.dropdownHeight > windowTop;
            // dropdownHeight - 1 for border
            var cssTop = !dropdownFitsBelow && dropdownFitsAbove ? "-" + (this.dropdownHeight - 1) + "px" : "";
            this.concodeList.css("top", cssTop);
        },
        // we only bind dropdown listeners when the dropdown is open
        _bindDropdownListeners: function () {
            var that = this;
            // when mouse over a list item, just highlight that one
            // we add the class "highlight", so if they hit "enter" we know which one to select
            this.concodeList.on("mouseover" + this.ns, ".concode", function (e) {
                that._highlightListItem($(this));
            });
            // listen for concode selection
            this.concodeList.on("click" + this.ns, ".concode", function (e) {
                that._selectListItem($(this));
            });
            // click off to close
            // (except when this initial opening click is bubbling up)
            // we cannot just stopPropagation as it may be needed to close another instance
            var isOpening = true;
            $("html").on("click" + this.ns, function (e) {
                if (!isOpening) {
                    that._closeDropdown();
                }
                isOpening = false;
            });
            // Listen for up/down scrolling, enter to select, or letters to jump to concode name.
            // Use keydown as keypress doesn't fire for non-char keys and we want to catch if they
            // just hit down and hold it to scroll down (no keyup event).
            // Listen on the document because that's where key events are triggered if no input has focus
            $(document).on("keydown" + this.ns, function (e) {
                // prevent down key from scrolling the whole page,
                // and enter key from submitting a form etc
                e.preventDefault();
                if (e.which == keys.UP || e.which == keys.DOWN) {
                    // up and down to navigate
                    that._handleUpDownKey(e.which);
                } else if (e.which == keys.ENTER) {
                    // enter to select
                    that._handleEnterKey();
                } else if (e.which == keys.ESC) {
                    // esc to close
                    that._closeDropdown();
                } else if (e.which >= keys.A && e.which <= keys.Z) {
                    // upper case letters (note: keyup/keydown only return upper case letters)
                    // cycle through countries beginning with that letter
                    that._handleLetterKey(e.which);
                }
            });
        },
        // Highlight the next/prev item in the list (and ensure it is visible)
        _handleUpDownKey: function (key) {
            var current = this.concodeList.children(".highlight").first();
            var next = key == keys.UP ? current.prev() : current.next();
            if (next.length) {
                // skip the divider
                if (next.hasClass("divider")) {
                    next = key == keys.UP ? next.prev() : next.next();
                }
                this._highlightListItem(next);
                this._scrollTo(next);
            }
        },
        // select the currently highlighted item
        _handleEnterKey: function () {
            var currentconcode = this.concodeList.children(".highlight").first();
            if (currentconcode.length) {
                this._selectListItem(currentconcode);
            }
        },
        // Iterate through the countries starting with the given letter
        _handleLetterKey: function (key) {
            var letter = String.fromCharCode(key);
            // filter out the countries beginning with that letter
            var countries = this.concodeListItems.filter(function () {
                return $(this).text().charAt(0) == letter && !$(this).hasClass("preferred");
            });
            if (countries.length) {
                // if one is already highlighted, then we want the next one
                var highlightedconcode = countries.filter(".highlight").first(), listItem;
                // if the next concode in the list also starts with that letter
                if (highlightedconcode && highlightedconcode.next() && highlightedconcode.next().text().charAt(0) == letter) {
                    listItem = highlightedconcode.next();
                } else {
                    listItem = countries.first();
                }
                // update highlighting and scroll
                this._highlightListItem(listItem);
                this._scrollTo(listItem);
            }
        },
        // Update the selected flag using the input's current value
        _updateFlagFromInputVal: function () {
            var that = this;
            // try and extract valid concode from input
            var value = this.concodeInput.val().replace(/(?=[() ])/g, '\\');
            if (value) {
                var concodeCodes = [];
                var matcher = new RegExp("^" + value, "i");
                for (var i = 0; i < this.countries.length; i++) {
                    if (this.countries[i].name.match(matcher)) {
                        concodeCodes.push(this.countries[i].iso2);
                    }
                }
                // Check if one of the matching countries is already selected
                var alreadySelected = false;
                $.each(concodeCodes, function (i, c) {
                    if (that.selectedFlagInner.hasClass(c)) {
                        alreadySelected = true;
                    }
                });
                if (!alreadySelected) {
                    this._selectFlag(concodeCodes[0]);
                    this.concodeCodeInput.val(concodeCodes[0]).trigger("change");
                }
                // Matching concode found
                return true;
            }
            // No match found
            return false;
        },
        // remove highlighting from other list items and highlight the given item
        _highlightListItem: function (listItem) {
            this.concodeListItems.removeClass("highlight");
            listItem.addClass("highlight");
        },
        // find the concode data for the given concode code
        // the ignoreOnlyCountriesOption is only used during init() while parsing the onlyCountries array
        _getconcodeData: function (concodeCode, ignoreOnlyCountriesOption) {
            var concodeList = ignoreOnlyCountriesOption ? allCountries : this.countries;
            for (var i = 0; i < concodeList.length; i++) {
                if (concodeList[i].iso2 == concodeCode) {
                    return concodeList[i];
                }
            }
            return null;
        },
        // update the selected flag and the active list item
        _selectFlag: function (concodeCode) {
            if (!concodeCode) {
                return false;
            }
            this.selectedFlagInner.attr("class", "flag " + concodeCode);
            // update the title attribute
            var concodeData = this._getconcodeData(concodeCode);
            this.selectedFlagInner.parent().attr("title", concodeData.name);
            // update the active list item
            var listItem = this.concodeListItems.children(".flag." + concodeCode).first().parent();
            this.concodeListItems.removeClass("active");
            listItem.addClass("active");
        },
        // called when the user selects a list item from the dropdown
        _selectListItem: function (listItem) {
            // update selected flag and active list item
            var concodeCode = listItem.attr("data-concode-code");
            this._selectFlag(concodeCode);
            this._closeDropdown();
            // update input value
            this._updateName(concodeCode);
            this.concodeInput.trigger("change");
            this.concodeCodeInput.trigger("change");
            // focus the input
            this._focus();
        },
        // close the dropdown and unbind any listeners
        _closeDropdown: function () {
            this.concodeList.addClass("hide");
            // update the arrow
            this.selectedFlagInner.children(".arrow").removeClass("up");
            // unbind event listeners
            $(document).off("keydown" + this.ns);
            $("html").off("click" + this.ns);
            // unbind both hover and click listeners
            this.concodeList.off(this.ns);
        },
        // check if an element is visible within its container, else scroll until it is
        _scrollTo: function (element) {
            if (!element || !element.offset()) {
                return;
            }
            var container = this.concodeList, containerHeight = container.height(), containerTop = container.offset().top, containerBottom = containerTop + containerHeight, elementHeight = element.outerHeight(), elementTop = element.offset().top, elementBottom = elementTop + elementHeight, newScrollTop = elementTop - containerTop + container.scrollTop();
            if (elementTop < containerTop) {
                // scroll up
                container.scrollTop(newScrollTop);
            } else if (elementBottom > containerBottom) {
                // scroll down
                var heightDifference = containerHeight - elementHeight;
                container.scrollTop(newScrollTop - heightDifference);
            }
        },
        // Replace any existing concode name with the new one
        _updateName: function (concodeCode) {
            this.concodeCodeInput.val(concodeCode).trigger("change");
            this.concodeInput.val(this._getconcodeData(concodeCode).name);
        },
        /********************
		 *  PUBLIC METHODS
		 ********************/
        // this is called when the geoip call returns
        handleAutoconcode: function () {
            if (this.options.initialconcode === "auto") {
                // we must set this even if there is an initial val in the input: in case the initial val is invalid and they delete it - they should see their auto concode
                this.defaultconcode = $.fn[pluginName].autoconcode;
                // if there's no initial value in the input, then update the flag
                if (!this.concodeInput.val()) {
                    this.selectconcode(this.defaultconcode);
                }
                this.autoconcodeDeferred.resolve();
            }
        },
        // get the concode data for the currently selected flag
        getSelectedconcodeData: function () {
            // rely on the fact that we only set 2 classes on the selected flag element:
            // the first is "flag" and the second is the 2-char concode code
            var concodeCode = this.selectedFlagInner.attr("class").split(" ")[1];
            return this._getconcodeData(concodeCode);
        },
        // update the selected flag
        selectconcode: function (concodeCode) {
            concodeCode = concodeCode.toLowerCase();
            // check if already selected
            if (!this.selectedFlagInner.hasClass(concodeCode)) {
                this._selectFlag(concodeCode);
                this._updateName(concodeCode);
            }
        },
        // set the input value and update the flag
        setconcode: function (concode) {
            this.concodeInput.val(concode);
            this._updateFlagFromInputVal();
        },
        // remove plugin
        destroy: function () {
            // stop listeners
            this.concodeInput.off(this.ns);
            this.selectedFlagInner.parent().off(this.ns);
            // remove markup
            var container = this.concodeInput.parent();
            container.before(this.concodeInput).remove();
        }
    };
    // adapted to allow public functions
    // using https://github.com/jquery-boilerplate/jquery-boilerplate/wiki/Extending-jQuery-Boilerplate
    $.fn[pluginName] = function (options) {
        var args = arguments;
        // Is the first parameter an object (options), or was omitted,
        // instantiate a new instance of the plugin.
        if (options === undefined || typeof options === "object") {
            return this.each(function () {
                if (!$.data(this, "plugin_" + pluginName)) {
                    $.data(this, "plugin_" + pluginName, new Plugin(this, options));
                }
            });
        } else if (typeof options === "string" && options[0] !== "_" && options !== "init") {
            // If the first parameter is a string and it doesn't start
            // with an underscore or "contains" the `init`-function,
            // treat this as a call to a public method.
            // Cache the method call to make it possible to return a value
            var returns;
            this.each(function () {
                var instance = $.data(this, "plugin_" + pluginName);
                // Tests that there's already a plugin-instance
                // and checks that the requested public method exists
                if (instance instanceof Plugin && typeof instance[options] === "function") {
                    // Call the method of our plugin instance,
                    // and pass it the supplied arguments.
                    returns = instance[options].apply(instance, Array.prototype.slice.call(args, 1));
                }
                // Allow instances to be destroyed via the 'destroy' method
                if (options === "destroy") {
                    $.data(this, "plugin_" + pluginName, null);
                }
            });
            // If the earlier cached method gives a value back return the value,
            // otherwise return this to preserve chainability.
            return returns !== undefined ? returns : this;
        }
    };
    /********************
   *  STATIC METHODS
   ********************/
    // get the concode data object
    $.fn[pluginName].getconcodeData = function () {
        return allCountries;
    };
    // set the concode data object
    $.fn[pluginName].setconcodeData = function (obj) {
        allCountries = obj;
    };
    // Tell JSHint to ignore this warning: "character may get silently deleted by one or more browsers"
    // jshint -W100
    // Array of concode objects for the flag dropdown.
    // Each contains a name and concode code (ISO 3166-1 alpha-2).
    //
    // Note: using single char property names to keep filesize down
    // n = name
    // i = iso2 (2-char concode code)
    var allCountries = $.each([{
        n: "93",
        i: "af"
    }, {
        n: "355",
        i: "al"
    }, {
        n: "213",
        i: "dz"
    }, {
        n: "684",
        i: "as"
    }, {
        n: "376",
        i: "ad"
    }, {
        n: "244",
        i: "ao"
    }, {
        n: "264",
        i: "ai"
    }, {
        n: "268",
        i: "ag"
    }, {
        n: "54",
        i: "ar"
    }, {
        n: "374",
        i: "am"
    }, {
        n: "297",
        i: "aw"
    }, {
        n: "61",
        i: "au"
    }, {
        n: "43",
        i: "at"
    }, {
        n: "994",
        i: "az"
    }, {
        n: "242",
        i: "bs"
    }, {
        n: "973",
        i: "bh"
    }, {
        n: "880",
        i: "bd"
    }, {
        n: "246",
        i: "bb"
    }, {
        n: "375",
        i: "by"
    }, {
        n: "32",
        i: "be"
    }, {
        n: "501",
        i: "bz"
    }, {
        n: "229",
        i: "bj"
    }, {
        n: "441",
        i: "bm"
    }, {
        n: "975",
        i: "bt"
    }, {
        n: "591",
        i: "bo"
    }, {
        n: "387",
        i: "ba"
    }, {
        n: "267",
        i: "bw"
    }, {
        n: "55",
        i: "br"
    }, {
        n: "284",
        i: "vg"
    }, {
        n: "673",
        i: "bn"
    }, {
        n: "359",
        i: "bg"
    }, {
        n: "226",
        i: "bf"
    }, {
        n: "257",
        i: "bi"
    }, {
        n: "855",
        i: "kh"
    }, {
        n: "237",
        i: "cm"
    }, {
        n: "1",
        i: "ca"
    }, {
        n: "238",
        i: "cv"
    }, {
        n: "345",
        i: "ky"
    }, {
        n: "236",
        i: "cf"
    }, {
        n: "235",
        i: "td"
    }, {
        n: "56",
        i: "cl"
    }, {
        n: "86",
        i: "cn"
    }, {
        n: "61",
        i: "cx"
    }, {
        n: "61",
        i: "cc"
    }, {
        n: "57",
        i: "co"
    }, {
        n: "269",
        i: "km"
    }, {
        n: "242",
        i: "cd"
    }, {
        n: "243",
        i: "cg"
    }, {
        n: "682",
        i: "ck"
    }, {
        n: "506",
        i: "cr"
    }, {
        n: "225",
        i: "ci"
    }, {
        n: "385",
        i: "hr"
    }, {
        n: "53",
        i: "cu"
    }, {
        n: "357",
        i: "cy"
    }, {
        n: "420",
        i: "cz"
    }, {
        n: "45",
        i: "dk"
    }, {
        n: "253",
        i: "dj"
    }, {
        n: "767",
        i: "dm"
    }, {
        n: "849",
        i: "do"
    }, {
        n: "593",
        i: "ec"
    }, {
        n: "20",
        i: "eg"
    }, {
        n: "503",
        i: "sv"
    }, {
        n: "240",
        i: "gq"
    }, {
        n: "291",
        i: "er"
    }, {
        n: "372",
        i: "ee"
    }, {
        n: "251",
        i: "et"
    }, {
        n: "500",
        i: "fk"
    }, {
        n: "298",
        i: "fo"
    }, {
        n: "679",
        i: "fj"
    }, {
        n: "358",
        i: "fi"
    }, {
        n: "33",
        i: "fr"
    }, {
        n: "594",
        i: "gf"
    }, {
        n: "689",
        i: "pf"
    }, {
        n: "241",
        i: "ga"
    }, {
        n: "220",
        i: "gm"
    }, {
        n: "995",
        i: "ge"
    }, {
        n: "49",
        i: "de"
    }, {
        n: "233",
        i: "gh"
    }, {
        n: "350",
        i: "gi"
    }, {
        n: "30",
        i: "gr"
    }, {
        n: "299",
        i: "gl"
    }, {
        n: "473",
        i: "gd"
    }, {
        n: "590",
        i: "gp"
    }, {
        n: "671",
        i: "gu"
    }, {
        n: "502",
        i: "gt"
    }, {
        n: "224",
        i: "gn"
    }, {
        n: "245",
        i: "gw"
    }, {
        n: "592",
        i: "gy"
    }, {
        n: "509",
        i: "ht"
    }, {
        n: "504",
        i: "hn"
    }, {
        n: "852",
        i: "hk"
    }, {
        n: "36",
        i: "hu"
    }, {
        n: "354",
        i: "is"
    }, {
        n: "91",
        i: "in"
    }, {
        n: "62",
        i: "id"
    }, {
        n: "98",
        i: "ir"
    }, {
        n: "964",
        i: "iq"
    }, {
        n: "353",
        i: "ie"
    }, {
        n: "972",
        i: "il"
    }, {
        n: "39",
        i: "it"
    }, {
        n: "876",
        i: "jm"
    }, {
        n: "81",
        i: "jp"
    }, {
        n: "962",
        i: "jo"
    }, {
        n: "7",
        i: "kz"
    }, {
        n: "254",
        i: "ke"
    }, {
        n: "686",
        i: "ki"
    }, {
        n: "965",
        i: "kw"
    }, {
        n: "996",
        i: "kg"
    }, {
        n: "856",
        i: "la"
    }, {
        n: "371",
        i: "lv"
    }, {
        n: "961",
        i: "lb"
    }, {
        n: "266",
        i: "ls"
    }, {
        n: "231",
        i: "lr"
    }, {
        n: "218",
        i: "ly"
    }, {
        n: "423",
        i: "li"
    }, {
        n: "370",
        i: "lt"
    }, {
        n: "352",
        i: "lu"
    }, {
        n: "853",
        i: "mo"
    }, {
        n: "389",
        i: "mk"
    }, {
        n: "261",
        i: "mg"
    }, {
        n: "265",
        i: "mw"
    }, {
        n: "60",
        i: "my"
    }, {
        n: "960",
        i: "mv"
    }, {
        n: "223",
        i: "ml"
    }, {
        n: "356",
        i: "mt"
    }, {
        n: "692",
        i: "mh"
    }, {
        n: "596",
        i: "mq"
    }, {
        n: "222",
        i: "mr"
    }, {
        n: "230",
        i: "mu"
    }, {
        n: "262",
        i: "yt"
    }, {
        n: "52",
        i: "mx"
    }, {
        n: "691",
        i: "fm"
    }, {
        n: "373",
        i: "md"
    }, {
        n: "377",
        i: "mc"
    }, {
        n: "976",
        i: "mn"
    }, {
        n: "382",
        i: "me"
    }, {
        n: "664",
        i: "ms"
    }, {
        n: "212",
        i: "ma"
    }, {
        n: "258",
        i: "mz"
    }, {
        n: "95",
        i: "mm"
    }, {
        n: "264",
        i: "na"
    }, {
        n: "674",
        i: "nr"
    }, {
        n: "977",
        i: "np"
    }, {
        n: "31",
        i: "nl"
    }, {
        n: "687",
        i: "nc"
    }, {
        n: "64",
        i: "nz"
    }, {
        n: "505",
        i: "ni"
    }, {
        n: "227",
        i: "ne"
    }, {
        n: "234",
        i: "ng"
    }, {
        n: "683",
        i: "nu"
    }, {
        n: "672",
        i: "nf"
    }, {
        n: "850",
        i: "kp"
    }, {
        n: "670",
        i: "mp"
    }, {
        n: "47",
        i: "no"
    }, {
        n: "968",
        i: "om"
    }, {
        n: "92",
        i: "pk"
    }, {
        n: "680",
        i: "pw"
    }, {
        n: "970",
        i: "ps"
    }, {
        n: "507",
        i: "pa"
    }, {
        n: "675",
        i: "pg"
    }, {
        n: "595",
        i: "py"
    }, {
        n: "51",
        i: "pe"
    }, {
        n: "63",
        i: "ph"
    }, {
        n: "870",
        i: "pn"
    }, {
        n: "48",
        i: "pl"
    }, {
        n: "351",
        i: "pt"
    }, {
        n: "787",
        i: "pr"
    }, {
        n: "974",
        i: "qa"
    }, {
        n: "262",
        i: "re"
    }, {
        n: "40",
        i: "ro"
    }, {
        n: "7",
        i: "ru"
    }, {
        n: "250",
        i: "rw"
    }, {
        n: "290",
        i: "bl"
    }, {
        n: "869",
        i: "kn"
    }, {
        n: "758",
        i: "lc"
    }, {
        n: "508",
        i: "pm"
    }, {
        n: "784",
        i: "vc"
    }, {
        n: "685",
        i: "ws"
    }, {
        n: "378",
        i: "sm"
    }, {
        n: "239",
        i: "st"
    }, {
        n: "966",
        i: "sa"
    }, {
        n: "221",
        i: "sn"
    }, {
        n: "381",
        i: "rs"
    }, {
        n: "248",
        i: "sc"
    }, {
        n: "232",
        i: "sl"
    }, {
        n: "65",
        i: "sg"
    }, {
        n: "421",
        i: "sk"
    }, {
        n: "386",
        i: "si"
    }, {
        n: "677",
        i: "sb"
    }, {
        n: "252",
        i: "so"
    }, {
        n: "27",
        i: "za"
    }, {
        n: "34",
        i: "es"
    }, {
        n: "94",
        i: "lk"
    }, {
        n: "249",
        i: "sd"
    }, {
        n: "597",
        i: "sr"
    }, {
        n: "47",
        i: "sj"
    }, {
        n: "268",
        i: "sz"
    }, {
        n: "46",
        i: "se"
    }, {
        n: "41",
        i: "ch"
    }, {
        n: "963",
        i: "sy"
    }, {
        n: "886",
        i: "tw"
    }, {
        n: "992",
        i: "tj"
    }, {
        n: "255",
        i: "tz"
    }, {
        n: "66",
        i: "th"
    }, {
        n: "670",
        i: "tl"
    }, {
        n: "228",
        i: "tg"
    }, {
        n: "690",
        i: "tk"
    }, {
        n: "676",
        i: "to"
    }, {
        n: "868",
        i: "tt"
    }, {
        n: "216",
        i: "tn"
    }, {
        n: "90",
        i: "tr"
    }, {
        n: "993",
        i: "tm"
    }, {
        n: "649",
        i: "tc"
    }, {
        n: "688",
        i: "tv"
    }, {
        n: "256",
        i: "ug"
    }, {
        n: "380",
        i: "ua"
    }, {
        n: "971",
        i: "ae"
    }, {
        n: "44",
        i: "gb"
    }, {
        n: "1",
        i: "us"
    }, {
        n: "284",
        i: "um"
    }, {
        n: "598",
        i: "uy"
    }, {
        n: "998",
        i: "uz"
    }, {
        n: "678",
        i: "vu"
    }, {
        n: "379",
        i: "va"
    }, {
        n: "58",
        i: "ve"
    }, {
        n: "84",
        i: "vn"
    }, {
        n: "681",
        i: "wf"
    }, {
        n: "967",
        i: "ye"
    }, {
        n: "260",
        i: "zm"
    }, {
        n: "263",
        i: "zw"
    }], function (i, c) {
        c.name = c.n;
        c.iso2 = c.i;
        delete c.n;
        delete c.i;
    });
});