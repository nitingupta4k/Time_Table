﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Time_Table.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Time Table</title>
    <link rel="shortcut icon" href="img/fav.ico" type="image/x-icon" />
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600" rel="stylesheet">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="btnDiv">
        <a href="../index.aspx" class="btn btn-outline btn-primary">Admin Panel</a>
    </div>
    <form id="form1" runat="server">
        <div class="cd-schedule loading">
            <div class="timeline">
                <ul>
                    <li><span>08:00</span></li>
                    <li><span>08:30</span></li>
                    <li><span>09:00</span></li>
                    <li><span>09:30</span></li>
                    <li><span>10:00</span></li>
                    <li><span>10:30</span></li>
                    <li><span>11:00</span></li>
                    <li><span>11:30</span></li>
                    <li><span>12:00</span></li>
                    <li><span>12:30</span></li>
                    <li><span>13:00</span></li>
                    <li><span>13:30</span></li>
                    <li><span>14:00</span></li>
                    <li><span>14:30</span></li>
                    <li><span>15:00</span></li>
                    <li><span>15:30</span></li>
                    <li><span>16:00</span></li>
                    <li><span>16:30</span></li>
                    <li><span>17:00</span></li>
                    <li><span>17:30</span></li>
                    <li><span>18:00</span></li>
                    <li><span>18:30</span></li>
                    <li><span>19:00</span></li>
                    <li><span>19:30</span></li>
                    <li><span>20:00</span></li>
                    <li><span>20:30</span></li>
                    <li><span>21:00</span></li>
                </ul>
            </div>
            <div class="events" id="divTimeTable">
            </div>
            <div class="event-modal">
                <header class="header">
                    <div class="content">
                        <span class="event-date"></span>
                        <h3 class="event-name"></h3>
                    </div>

                    <div class="header-bg"></div>
                </header>

                <div class="body">
                    <div class="event-info">
                        <div>
                            <label id="lblCourse"></label>
                            <label id="lbllecturer"></label>
                            <label id="lblContactNumber"></label>
                            <label id="lblEmail"></label>
                            <label id="lblECTS"></label>
                        </div>
                    </div>
                    <div class="body-bg"></div>
                </div>

                <a href="#0" class="close">Close</a>
            </div>

            <div class="cover-layer"></div>
        </div>
        <!-- .cd-schedule -->

    </form>
    <script src="js/modernizr.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            getTimeTable();
        });

        if (!window.jQuery) document.write('<script src="js/jquery-3.0.0.min.js"><\/script>');


        function getTimeTable(ele) {
            //showhide('divhover', 's');
            $.ajax({
                type: "POST",
                url: "Home.aspx/webgetTimeTable",
                data: '',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    fillTimeTable(response.d);
                },
                failure: function (response) {
                    //alert("Somthing went worng, Please try again.");
                }
            });
        }

        function fillTimeTable(ele) {
            var Mon = "<li class='events-group'><div class='top-info'><span>Monday</span></div><ul>";
            var Tue = "<li class='events-group'><div class='top-info'><span>Tuesday</span></div><ul>";
            var Wed = "<li class='events-group'><div class='top-info'><span>Wednesday</span></div><ul>";
            var Thu = "<li class='events-group'><div class='top-info'><span>Thursday</span></div><ul>";
            var Fri = "<li class='events-group'><div class='top-info'><span>Friday</span></div><ul>";
            for (i = 0; i < ele.length; i++) {

                var jsLang = ele[i].Day;
                switch (jsLang) {
                    case '1':
                        Mon = Mon + "<li class='single-event' data-start='" + ele[i].timeFrom + "' data-end='" + ele[i].timeTo + "' data-content='event-abs-circuit' data-event='event-1'>" +
                                "<a href='#0' style='background: " + ele[i].colorCode + ";'><div class='event-info' style='display: none;'>" +
                                "<label id='lblCourse'>Course : " + ele[i].coursesName + "</label>" +
                                "<label id='lbllecturer'>lecturer : " + ele[i].commonName + " " + ele[i].middleName + "" + ele[i].givenName + " </label>" +
                                "<label id='lblContactNumber'>Contact : " + ele[i].contactNumber + "</label>" +
                                "<label id='lblEmail'>Email : " + ele[i].email + "</label>" +
                                "<label id='lblECTS'>ECTS : " + ele[i].ects + "</label> </div>" +
                                "<em class='event-name '>" + ele[i].courseCode + "</em></a></li>";
                        break;
                    case '2':
                        Tue = Tue + "<li class='single-event' data-start='" + ele[i].timeFrom + "' data-end='" + ele[i].timeTo + "' data-content='event-abs-circuit' data-event='event-1'>" +
                                "<a href='#0' style='background: " + ele[i].colorCode + ";'><div class='event-info' style='display: none;'>" +
                                "<label id='lblCourse'>Course : " + ele[i].coursesName + "</label>" +
                                "<label id='lbllecturer'>lecturer : " + ele[i].commonName + " " + ele[i].middleName + "" + ele[i].givenName + " </label>" +
                                "<label id='lblContactNumber'>Contact : " + ele[i].contactNumber + "</label>" +
                                "<label id='lblEmail'>Email : " + ele[i].email + "</label>" +
                                "<label id='lblECTS'>ECTS : " + ele[i].ects + "</label> </div>" +
                                "<em class='event-name '>" + ele[i].courseCode + "</em></a></li>";
                        break;
                    case '3':
                        Wed = Wed + "<li class='single-event' data-start='" + ele[i].timeFrom + "' data-end='" + ele[i].timeTo + "' data-content='event-abs-circuit' data-event='event-1'>" +
                                "<a href='#0' style='background: " + ele[i].colorCode + ";'><div class='event-info' style='display: none;'>" +
                                "<label id='lblCourse'>Course : " + ele[i].coursesName + "</label>" +
                                "<label id='lbllecturer'>lecturer : " + ele[i].commonName + " " + ele[i].middleName + "" + ele[i].givenName + " </label>" +
                                "<label id='lblContactNumber'>Contact : " + ele[i].contactNumber + "</label>" +
                                "<label id='lblEmail'>Email : " + ele[i].email + "</label>" +
                                "<label id='lblECTS'>ECTS : " + ele[i].ects + "</label> </div>" +
                                "<em class='event-name '>" + ele[i].courseCode + "</em></a></li>";
                        break;
                    case '4':
                        Thu = Thu + "<li class='single-event' data-start='" + ele[i].timeFrom + "' data-end='" + ele[i].timeTo + "' data-content='event-abs-circuit' data-event='event-1'>" +
                                "<a href='#0' style='background: " + ele[i].colorCode + ";'><div class='event-info' style='display: none;'>" +
                                "<label id='lblCourse'>Course : " + ele[i].coursesName + "</label>" +
                                "<label id='lbllecturer'>lecturer : " + ele[i].commonName + " " + ele[i].middleName + "" + ele[i].givenName + " </label>" +
                                "<label id='lblContactNumber'>Contact : " + ele[i].contactNumber + "</label>" +
                                "<label id='lblEmail'>Email : " + ele[i].email + "</label>" +
                                "<label id='lblECTS'>ECTS : " + ele[i].ects + "</label> </div>" +
                                "<em class='event-name '>" + ele[i].courseCode + "</em></a></li>";
                        break;
                    case '5':
                        Fri = Fri + "<li class='single-event' data-start='" + ele[i].timeFrom + "' data-end='" + ele[i].timeTo + "' data-content='event-abs-circuit' data-event='event-1'>" +
                                "<a href='#0' style='background: " + ele[i].colorCode + ";'><div class='event-info' style='display: none;'>" +
                                "<label id='lblCourse'>Course : " + ele[i].coursesName + "</label>" +
                                "<label id='lbllecturer'>lecturer : " + ele[i].commonName + " " + ele[i].middleName + "" + ele[i].givenName + " </label>" +
                                "<label id='lblContactNumber'>Contact : " + ele[i].contactNumber + "</label>" +
                                "<label id='lblEmail'>Email : " + ele[i].email + "</label>" +
                                "<label id='lblECTS'>ECTS : " + ele[i].ects + "</label> </div>" +
                                "<em class='event-name '>" + ele[i].courseCode + "</em></a></li>";
                        break;
                    default:
                        break;
                }

            }
            Mon = Mon + "</ul></li>";
            Tue = Tue + "</ul></li>";
            Wed = Wed + "</ul></li>";
            Thu = Thu + "</ul></li>";
            Fri = Fri + "</ul></li>";
            var t = "<ul>" + Mon + Tue + Wed + Thu + Fri + "</ul>";
            $('#divTimeTable').append(t);
            loadtable();
        }

        function loadtable() {
            var transitionEnd = 'webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend';
            var transitionsSupported = ($('.csstransitions').length > 0);
            //if browser does not support transitions - use a different event to trigger them
            if (!transitionsSupported) transitionEnd = 'noTransition';

            //should add a loding while the events are organized 

            function SchedulePlan(element) {
                this.element = element;
                this.timeline = this.element.find('.timeline');
                this.timelineItems = this.timeline.find('li');
                this.timelineItemsNumber = this.timelineItems.length;
                //alert(getScheduleTimestamp(this.timelineItems.eq(0).text()));
                this.timelineStart = getScheduleTimestamp(this.timelineItems.eq(0).text());
                //need to store delta (in our case half hour) timestamp
                this.timelineUnitDuration = getScheduleTimestamp(this.timelineItems.eq(1).text()) - getScheduleTimestamp(this.timelineItems.eq(0).text());

                this.eventsWrapper = this.element.find('.events');
                this.eventsGroup = this.eventsWrapper.find('.events-group');
                this.singleEvents = this.eventsGroup.find('.single-event');
                this.eventSlotHeight = this.eventsGroup.eq(0).children('.top-info').outerHeight();

                this.modal = this.element.find('.event-modal');
                this.modalHeader = this.modal.find('.header');
                this.modalHeaderBg = this.modal.find('.header-bg');
                this.modalBody = this.modal.find('.body');
                this.modalBodyBg = this.modal.find('.body-bg');
                this.modalMaxWidth = 800;
                this.modalMaxHeight = 480;

                this.animating = false;

                this.initSchedule();
            }

            SchedulePlan.prototype.initSchedule = function () {
                this.scheduleReset();
                this.initEvents();
            };

            SchedulePlan.prototype.scheduleReset = function () {
                var mq = this.mq();
                if (mq == 'desktop' && !this.element.hasClass('js-full')) {
                    //in this case you are on a desktop version (first load or resize from mobile)
                    this.eventSlotHeight = this.eventsGroup.eq(0).children('.top-info').outerHeight();
                    this.element.addClass('js-full');
                    this.placeEvents();
                    this.element.hasClass('modal-is-open') && this.checkEventModal();
                } else if (mq == 'mobile' && this.element.hasClass('js-full')) {
                    //in this case you are on a mobile version (first load or resize from desktop)
                    this.element.removeClass('js-full loading');
                    this.eventsGroup.children('ul').add(this.singleEvents).removeAttr('style');
                    this.eventsWrapper.children('.grid-line').remove();
                    this.element.hasClass('modal-is-open') && this.checkEventModal();
                } else if (mq == 'desktop' && this.element.hasClass('modal-is-open')) {
                    //on a mobile version with modal open - need to resize/move modal window
                    this.checkEventModal('desktop');
                    this.element.removeClass('loading');
                } else {
                    this.element.removeClass('loading');
                }
            };

            SchedulePlan.prototype.initEvents = function () {
                var self = this;

                this.singleEvents.each(function () {
                    //create the .event-date element for each event
                    var durationLabel = '<span class="event-date">' + $(this).data('start') + ' - ' + $(this).data('end') + '</span>';
                    $(this).children('a').prepend($(durationLabel));

                    //detect click on the event and open the modal
                    $(this).on('click', 'a', function (event) {
                        event.preventDefault();
                        if (!self.animating) self.openModal($(this));
                    });
                });

                //close modal window
                this.modal.on('click', '.close', function (event) {
                    event.preventDefault();
                    if (!self.animating) self.closeModal(self.eventsGroup.find('.selected-event'));
                });
                this.element.on('click', '.cover-layer', function (event) {
                    if (!self.animating && self.element.hasClass('modal-is-open')) self.closeModal(self.eventsGroup.find('.selected-event'));
                });
            };

            SchedulePlan.prototype.placeEvents = function () {
                var self = this;
                this.singleEvents.each(function () {
                    //place each event in the grid -> need to set top position and height
                    var start = getScheduleTimestamp($(this).attr('data-start')),
                        duration = getScheduleTimestamp($(this).attr('data-end')) - start;

                    var eventTop = self.eventSlotHeight * (start - self.timelineStart) / self.timelineUnitDuration,
                        eventHeight = self.eventSlotHeight * duration / self.timelineUnitDuration;

                    $(this).css({
                        top: (eventTop - 1) + 'px',
                        height: (eventHeight + 1) + 'px'
                    });
                });

                this.element.removeClass('loading');
            };

            SchedulePlan.prototype.openModal = function (event) {
                var self = this;
                var mq = self.mq();
                this.animating = true;

                //update event name and time
                this.modalHeader.find('.event-name').text(event.find('.event-name').text());
                this.modalHeader.find('.event-date').text(event.find('.event-date').text());
                this.modal.attr('data-event', event.parent().attr('data-event'));
                //alert(event.parent().attr('data-content'));
                //alert(event.find('.' + event.parent().attr('data-content')).text());
                //update event content
                this.modalBody.find('.event-info').load('home.aspx .event-info > *', function (data) {
                    //once the event content has been loaded
                    self.element.addClass('content-loaded');
                    self.element.find('.event-info div #lblCourse').text(event.find('.event-info #lblCourse').text());//'.' + event.parent().attr('data-content')
                    self.element.find('.event-info div #lbllecturer').text(event.find('.event-info #lbllecturer').text());
                    self.element.find('.event-info div #lblContactNumber').text(event.find('.event-info #lblContactNumber').text());
                    self.element.find('.event-info div #lblEmail').text(event.find('.event-info #lblEmail').text());
                    self.element.find('.event-info div #lblECTS').text(event.find('.event-info #lblECTS').text());
                });

                this.element.addClass('modal-is-open');

                setTimeout(function () {
                    //fixes a flash when an event is selected - desktop version only
                    event.parent('li').addClass('selected-event');
                }, 10);

                if (mq == 'mobile') {
                    self.modal.one(transitionEnd, function () {
                        self.modal.off(transitionEnd);
                        self.animating = false;
                    });
                } else {
                    var eventTop = event.offset().top - $(window).scrollTop(),
                        eventLeft = event.offset().left,
                        eventHeight = event.innerHeight(),
                        eventWidth = event.innerWidth();

                    var windowWidth = $(window).width(),
                        windowHeight = $(window).height();

                    var modalWidth = (windowWidth * .8 > self.modalMaxWidth) ? self.modalMaxWidth : windowWidth * .8,
                        modalHeight = (windowHeight * .8 > self.modalMaxHeight) ? self.modalMaxHeight : windowHeight * .8;

                    var modalTranslateX = parseInt((windowWidth - modalWidth) / 2 - eventLeft),
                        modalTranslateY = parseInt((windowHeight - modalHeight) / 2 - eventTop);

                    var HeaderBgScaleY = modalHeight / eventHeight,
                        BodyBgScaleX = (modalWidth - eventWidth);

                    //change modal height/width and translate it
                    self.modal.css({
                        top: eventTop + 'px',
                        left: eventLeft + 'px',
                        height: modalHeight + 'px',
                        width: modalWidth + 'px',
                    });
                    transformElement(self.modal, 'translateY(' + modalTranslateY + 'px) translateX(' + modalTranslateX + 'px)');

                    //set modalHeader width
                    self.modalHeader.css({
                        width: eventWidth + 'px',
                    });
                    //set modalBody left margin
                    self.modalBody.css({
                        marginLeft: eventWidth + 'px',
                    });

                    //change modalBodyBg height/width ans scale it
                    self.modalBodyBg.css({
                        height: eventHeight + 'px',
                        width: '1px',
                    });
                    transformElement(self.modalBodyBg, 'scaleY(' + HeaderBgScaleY + ') scaleX(' + BodyBgScaleX + ')');

                    //change modal modalHeaderBg height/width and scale it
                    self.modalHeaderBg.css({
                        height: eventHeight + 'px',
                        width: eventWidth + 'px',
                    });
                    transformElement(self.modalHeaderBg, 'scaleY(' + HeaderBgScaleY + ')');

                    self.modalHeaderBg.one(transitionEnd, function () {
                        //wait for the  end of the modalHeaderBg transformation and show the modal content
                        self.modalHeaderBg.off(transitionEnd);
                        self.animating = false;
                        self.element.addClass('animation-completed');
                    });
                }

                //if browser do not support transitions -> no need to wait for the end of it
                if (!transitionsSupported) self.modal.add(self.modalHeaderBg).trigger(transitionEnd);
            };

            SchedulePlan.prototype.closeModal = function (event) {
                var self = this;
                var mq = self.mq();

                this.animating = true;

                if (mq == 'mobile') {
                    this.element.removeClass('modal-is-open');
                    this.modal.one(transitionEnd, function () {
                        self.modal.off(transitionEnd);
                        self.animating = false;
                        self.element.removeClass('content-loaded');
                        event.removeClass('selected-event');
                    });
                } else {
                    var eventTop = event.offset().top - $(window).scrollTop(),
                        eventLeft = event.offset().left,
                        eventHeight = event.innerHeight(),
                        eventWidth = event.innerWidth();

                    var modalTop = Number(self.modal.css('top').replace('px', '')),
                        modalLeft = Number(self.modal.css('left').replace('px', ''));

                    var modalTranslateX = eventLeft - modalLeft,
                        modalTranslateY = eventTop - modalTop;

                    self.element.removeClass('animation-completed modal-is-open');

                    //change modal width/height and translate it
                    this.modal.css({
                        width: eventWidth + 'px',
                        height: eventHeight + 'px'
                    });
                    transformElement(self.modal, 'translateX(' + modalTranslateX + 'px) translateY(' + modalTranslateY + 'px)');

                    //scale down modalBodyBg element
                    transformElement(self.modalBodyBg, 'scaleX(0) scaleY(1)');
                    //scale down modalHeaderBg element
                    transformElement(self.modalHeaderBg, 'scaleY(1)');

                    this.modalHeaderBg.one(transitionEnd, function () {
                        //wait for the  end of the modalHeaderBg transformation and reset modal style
                        self.modalHeaderBg.off(transitionEnd);
                        self.modal.addClass('no-transition');
                        setTimeout(function () {
                            self.modal.add(self.modalHeader).add(self.modalBody).add(self.modalHeaderBg).add(self.modalBodyBg).attr('style', '');
                        }, 10);
                        setTimeout(function () {
                            self.modal.removeClass('no-transition');
                        }, 20);

                        self.animating = false;
                        self.element.removeClass('content-loaded');
                        event.removeClass('selected-event');
                    });
                }

                //browser do not support transitions -> no need to wait for the end of it
                if (!transitionsSupported) self.modal.add(self.modalHeaderBg).trigger(transitionEnd);
            }

            SchedulePlan.prototype.mq = function () {
                //get MQ value ('desktop' or 'mobile') 
                var self = this;
                return window.getComputedStyle(this.element.get(0), '::before').getPropertyValue('content').replace(/["']/g, '');
            };

            SchedulePlan.prototype.checkEventModal = function (device) {
                this.animating = true;
                var self = this;
                var mq = this.mq();

                if (mq == 'mobile') {
                    //reset modal style on mobile
                    self.modal.add(self.modalHeader).add(self.modalHeaderBg).add(self.modalBody).add(self.modalBodyBg).attr('style', '');
                    self.modal.removeClass('no-transition');
                    self.animating = false;
                } else if (mq == 'desktop' && self.element.hasClass('modal-is-open')) {
                    self.modal.addClass('no-transition');
                    self.element.addClass('animation-completed');
                    var event = self.eventsGroup.find('.selected-event');

                    var eventTop = event.offset().top - $(window).scrollTop(),
                        eventLeft = event.offset().left,
                        eventHeight = event.innerHeight(),
                        eventWidth = event.innerWidth();

                    var windowWidth = $(window).width(),
                        windowHeight = $(window).height();

                    var modalWidth = (windowWidth * .8 > self.modalMaxWidth) ? self.modalMaxWidth : windowWidth * .8,
                        modalHeight = (windowHeight * .8 > self.modalMaxHeight) ? self.modalMaxHeight : windowHeight * .8;

                    var HeaderBgScaleY = modalHeight / eventHeight,
                        BodyBgScaleX = (modalWidth - eventWidth);

                    setTimeout(function () {
                        self.modal.css({
                            width: modalWidth + 'px',
                            height: modalHeight + 'px',
                            top: (windowHeight / 2 - modalHeight / 2) + 'px',
                            left: (windowWidth / 2 - modalWidth / 2) + 'px',
                        });
                        transformElement(self.modal, 'translateY(0) translateX(0)');
                        //change modal modalBodyBg height/width
                        self.modalBodyBg.css({
                            height: modalHeight + 'px',
                            width: '1px',
                        });
                        transformElement(self.modalBodyBg, 'scaleX(' + BodyBgScaleX + ')');
                        //set modalHeader width
                        self.modalHeader.css({
                            width: eventWidth + 'px',
                        });
                        //set modalBody left margin
                        self.modalBody.css({
                            marginLeft: eventWidth + 'px',
                        });
                        //change modal modalHeaderBg height/width and scale it
                        self.modalHeaderBg.css({
                            height: eventHeight + 'px',
                            width: eventWidth + 'px',
                        });
                        transformElement(self.modalHeaderBg, 'scaleY(' + HeaderBgScaleY + ')');
                    }, 10);

                    setTimeout(function () {
                        self.modal.removeClass('no-transition');
                        self.animating = false;
                    }, 20);
                }
            };

            var schedules = $('.cd-schedule');
            var objSchedulesPlan = [],
                windowResize = false;

            if (schedules.length > 0) {
                schedules.each(function () {
                    //create SchedulePlan objects
                    objSchedulesPlan.push(new SchedulePlan($(this)));
                });
            }

            $(window).on('resize', function () {
                if (!windowResize) {
                    windowResize = true;
                    (!window.requestAnimationFrame) ? setTimeout(checkResize) : window.requestAnimationFrame(checkResize);
                }
            });

            $(window).keyup(function (event) {
                if (event.keyCode == 27) {
                    objSchedulesPlan.forEach(function (element) {
                        element.closeModal(element.eventsGroup.find('.selected-event'));
                    });
                }
            });

            function checkResize() {
                objSchedulesPlan.forEach(function (element) {
                    element.scheduleReset();
                });
                windowResize = false;
            }

            function getScheduleTimestamp(time) {
                //accepts hh:mm format - convert hh:mm to timestamp
                time = time.replace(/ /g, '');
                var timeArray = time.split(':');
                var timeStamp = parseInt(timeArray[0]) * 60 + parseInt(timeArray[1]);
                return timeStamp;
            }

            function transformElement(element, value) {
                element.css({
                    '-moz-transform': value,
                    '-webkit-transform': value,
                    '-ms-transform': value,
                    '-o-transform': value,
                    'transform': value
                });
            }

        }

    </script>
</body>
</html>
