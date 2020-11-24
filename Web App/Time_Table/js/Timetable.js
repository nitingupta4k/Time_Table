
function showhide(idx, mode) {
    var myButtonClasses = document.getElementById(idx).classList;

    if (myButtonClasses.contains("hidden")) {
        myButtonClasses.remove("hidden");
    }

    if (mode === "h")
        document.getElementById(idx).className += " hidden "
    //else
    //    document.getElementById(idx).className += " show "

}

function checkDate() {
    if ($('#txtStartingDate').val() == null || $('#txtStartingDate').val() == "") {
        alert("Please select the start date");
        $('#txtEndingDate').val($('#txtStartingDate').val());
    }
    else {
        var stdt = $('#txtStartingDate').val().split('-');
        var eddt = $('#txtEndingDate').val().split('-');
        if (eddt[0] < stdt[0] || eddt[1] < stdt[1] || eddt[2] < stdt[2]) {
            alert("End date must be heigher than start date");
            $('#txtEndingDate').val($('#txtStartingDate').val());
        }
    }
}

function checkPassword() {
    //    var pass = $('#txtPassword').val();
    //    var cpass = $('#txtPassword').val();
}

function isnumber(ele) {
    $("#" + ele.id).keypress(function (e) {
        if (e.which < 48 || e.which > 57) {
            return false;
        }
        else if ($("#" + ele.id).val().length > 9) {
            return false;
        }
        else {
            remove0at0(ele.id);
            return true;
        }

    });
}

function isfloat(ele) {
    $("#" + ele.id).keypress(function (e) {
        //alert(e.which);        
        if (e.which < 46 || e.which > 57) {
            return false;
        }
        else if ($("#" + ele.id).val().length > 4) {
            return false;
        }
        else if ($('#' + ele.id).val().indexOf('.') >= 0) {
            var arr = $("#" + ele.id).val().split('.');
            if (arr[1].length > 1)
                return false;
        }
        else {
            remove0at0(ele.id);
            return true;
        }

    });
}

function remove0at0(ele) {
    if ($('#' + ele).val().indexOf('0') == 0 && $('#' + ele).val().indexOf('.') !== 1)
        $('#' + ele).val($('#' + ele).val().substring(0, 0));
}

function checkValLimit(ele) {
    var arr = ele.split('_');
    if (parseFloat($("#" + ele).val()) > parseInt('24')) {
        $("#" + ele).val('24.00');
    }
    if ($('#' + ele).val().indexOf('.') >= 0) {
        var arr2 = $("#" + ele).val().split('.');
        if (parseInt(arr2[1]) > parseInt(59)) {
            //alert
            arr2[0] = arr2[0] == null || arr2[0] == "" ? '0' : arr2[0];
            $("#" + arr[0]).val((parseInt(arr2[0] == '24' ? '23' : arr2[0]) + parseInt('1')) + '.00');
        }
    }
}

function isEmail(ele) {
    email = $("#" + ele.id).val();
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!regex.test(email))
        $("#" + ele.id).focus();
    //return regex.test(email);
}

function courseEdit(ele) {
    showhide("divForm", "s");
    showhide("divList", "h");
}

function timeSloatEdit(ele) {
    showhide("divForm", "s");
    showhide("divList", "h");
}

function clearPerson() {
    $("#lblhPersonid").text("0");
    $("#txtPersoncode").val("");
    $("#txtCommonName").val("");
    $("#txtGivenName").val("");
    $("#txtMiddleName").val("");
    $("#txtconcode").concodeSelect("setconcode", "372");
    $("#txtContactNumber").val("");
    $("#txEMail").val("");
    $("#txtdob").val("");
    $("#selGender").val("M");
    $("#txtAddress1").val("");
    $("#txtAddress2").val("");
    $("#txtCity").val("");
    $("#txtCountry").countrySelect("setCountry", "Estonia");
    $("#txtZipCode").val("");
    $("#selStatus").val("A");
}

function closePerson() {
    clearPerson();
    showhide("divForm", "h");
    showhide("divList", "s");
}

function getPerson(ele) {
    showhide('divhover', 's');
    $.ajax({
        type: "POST",
        url: "person.aspx/webgetPerson",
        data: '{id: ' + ele + ' }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            //$('.show').html(response);
            if (ele == 0)
                fillPersonlist(response.d);
            else
                fillPersonform(response.d);
        },
        failure: function (response) {
            alert("Somthing went worng, Please try again.");
        }
    });
}

function deletePerson(ele) {
    $.ajax({
        type: "POST",
        url: "person.aspx/webdeletePerson",
        data: '{id: ' + ele + ' }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response.d > 0) {
                alert("Person deleted successfully")
                getPerson(0);
            }
            else {
                alert("Somthing went worng, Please try again.");
            }
        },
        failure: function (response) {
            alert("Somthing went worng, Please try again.");
        }
    });
}

function fillPersonlist(ele) {

    var listtr = "";
    for (i = 0; i < ele.length; i++) {
        listtr = listtr + "<tr id=''><td>" + (i + 1) + "</td>";
        listtr = listtr + "<td>" + ele[i].code + "</td>";
        listtr = listtr + "<td>" + ele[i].commonName + " " + ele[i].givenName + " " + ele[i].middleName + "</td>";
        listtr = listtr + "<td>" + ele[i].CountryCode + " " + ele[i].contactNumber + "</td>";
        listtr = listtr + "<td>" + ele[i].email + "</td>";
        listtr = listtr + "<td>" + ele[i].status + "</td>";
        listtr = listtr + "<td><button type='button' class='btn btn-outline btn-primary btn-circle' onclick='getPerson(" + ele[i].id + ");'><i class='fa fa-pencil'></i></button>";
        listtr = listtr + "<button type='button' class='btn btn-outline btn-danger btn-circle' onclick='deletePerson(" + ele[i].id + ");'><i class='fa fa-trash-o'></i></button></td></tr>";
    }
    $("#tblPerson").find("tr:gt(0)").remove();
    $('#tblPerson').append(listtr);
    showhide('divhover', 'h');
}

function fillPersonform(ele) {
    showhide("divForm", "s");
    showhide("divList", "h");
    clearPerson();
    for (i = 0; i < ele.length; i++) {
        $("#lblhPersonid").text(ele[i].id == "" ? "0" : ele[i].id);
        $("#txtPersoncode").val(ele[i].code);
        $("#txtCommonName").val(ele[i].commonName);
        $("#txtGivenName").val(ele[i].givenName);
        $("#txtMiddleName").val(ele[i].middleName);
        $("#txtconcode").concodeSelect("setconcode", ele[i].CountryCode);
        $("#txtContactNumber").val(ele[i].contactNumber);
        $("#txEMail").val(ele[i].email);
        $("#txtdob").val(ele[i].dob);
        $("#selGender").val(ele[i].gender);
        $("#txtAddress1").val(ele[i].address1);
        $("#txtAddress2").val(ele[i].address2);
        $("#txtCity").val(ele[i].city);
        $("#txtCountry").countrySelect("setCountry", ele[i].country);
        $("#txtZipCode").val(ele[i].zip);
        $("#selStatus").val(ele[i].status == "Active" ? "A" : "I");
    }
    showhide('divhover', 'h');
}

function savePerson(ele) {
    showhide('divhover', 's');
    var list = {
        id: $("#lblhPersonid").text()
            , code: $("#txtPersoncode").val()
            , commonName: $("#txtCommonName").val()
            , givenName: $("#txtGivenName").val()
            , middleName: $("#txtMiddleName").val()
            , CountryCode: $("#txtconcode").val()
            , contactNumber: $("#txtContactNumber").val()
            , email: $("#txEMail").val()
            , dob: $("#txtdob").val()
            , gender: $("#selGender").val()
            , address1: $("#txtAddress1").val()
            , address2: $("#txtAddress2").val()
            , city: $("#txtCity").val()
            , country: $("#txtCountry").val()
            , zip: $("#txtZipCode").val()
            , status: $("#selStatus").val()
	        , userName: 'test'
            , password: 'test123'
    };
    $.ajax({
        type: "POST",
        url: "person.aspx/websavePerson",
        contentType: "application/json; charset=utf-8",
        data: '{ "list":' + JSON.stringify(list) + '}',
        dataType: "json",
        success: function (response) {
            if (response.d > 0) {
                alert("Person saved successfully")
                closePerson();
                getPerson(0);
            }
            else {
                alert("Somthing went worng, Please try again.");
            }
        },
        failure: function (response) {
            alert("Somthing went worng, Please try again.");
        }
    });
    showhide('divhover', 'h');
}

function serchPerson(ele) {
    showhide('personSearchul', 'h');
    var sertext = $("#" + ele).val();
    if (sertext.length > 2) {
        $.ajax({
            type: "POST",
            url: "Lecturer.aspx/webserchPerson",
            data: '{code: "' + sertext + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if ((response.d).length > 0)
                    fillSearchPersonlist(response.d);
                else {
                    $("#personSearchul").empty();
                }
                //alert("Somthing went worng, Please try again.");
                //alert("Somthing went worng, Please try again.");
            },
            failure: function (response) {
                alert("Somthing went worng, Please try again.");
            }
        });
    }
}

function fillSearchPersonlist(ele) {
    var listtr = "";
    for (i = 0; i < ele.length; i++) {
        listtr = listtr + "<li id='" + ele[i].id + "' onclick=getSearchperson('" + ele[i].id + "_" + ele[i].code + "')>" + ele[i].commonName + " " + ele[i].givenName + " " + ele[i].middleName + "</li>";
    }
    $("#personSearchul").empty();
    $('#personSearchul').append(listtr);
    showhide('personSearchul', 's');
}

function getSearchperson(ele) {
    var arr = ele.split('_');
    $("#lblhsearpersonID").text(arr[0]);
    $("#txtpersonalCode").val(arr[1]);
    $("#txtpersonalCode").focus();
    showhide('personSearchul', 'h');
    $("#personSearchul").empty();
}

function clearLecturer() {
    $("#lblhLecturerid").text("0");
    $("#lblhsearpersonID").text("");
    $("#txtpersonalCode").val("");
    $("#txtuniversityID").val("");
    $("#txtposition").val("");
    $("#selDepartment").val(1);
    $("#txtqualification").val("");
    $("#txtmaximumLecturePerDay").val("");
    $("#txtmaxLectureHoursPerDay").val("");
    $("#txtmaximumLecturePerCycle").val("");
    $("#txtDescription").val("");
    $("#selStatus").val('A');
}

function closeLecturer() {
    clearLecturer();
    showhide("divForm", "h");
    showhide("divList", "s");
}

function getLecturer(ele) {
    showhide('divhover', 's');
    $.ajax({
        type: "POST",
        url: "Lecturer.aspx/webgetLecturer",
        data: '{id: ' + ele + ' }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            //$('.show').html(response);
            if (ele == 0)
                fillLecturerlist(response.d);
            else
                fillLecturerform(response.d);
        },
        failure: function (response) {
            alert("Somthing went worng, Please try again.");
        }
    });
}

function deleteLecturer(ele) {
    $.ajax({
        type: "POST",
        url: "Lecturer.aspx/webdeleteLecturer",
        data: '{id: ' + ele + ' }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response.d > 0) {
                alert("Lecturer deleted successfully")
                getLecturer(0);
            }
            else {
                alert("Somthing went worng, Please try again.");
            }
        },
        failure: function (response) {
            alert("Somthing went worng, Please try again.");
        }
    });
}

function fillLecturerlist(ele) {

    var listtr = "";
    for (i = 0; i < ele.length; i++) {
        listtr = listtr + "<tr id=''><td>" + (i + 1) + "</td>";
        listtr = listtr + "<td>" + ele[i].personalCode + "</td>";
        listtr = listtr + "<td>" + ele[i].universityID + "</td>";
        listtr = listtr + "<td>" + ele[i].position + "</td>";
        listtr = listtr + "<td>" + ele[i].department + "</td>";
        listtr = listtr + "<td>" + ele[i].status + "</td>";
        listtr = listtr + "<td><button type='button' class='btn btn-outline btn-primary btn-circle' onclick='getLecturer(" + ele[i].id + ");'><i class='fa fa-pencil'></i></button>";
        listtr = listtr + "<button type='button' class='btn btn-outline btn-danger btn-circle' onclick='deleteLecturer(" + ele[i].id + ");'><i class='fa fa-trash-o'></i></button></td></tr>";
    }
    $("#tblLecturer").find("tr:gt(0)").remove();
    $('#tblLecturer').append(listtr);
    showhide('divhover', 'h');
}

function fillLecturerform(ele) {
    showhide("divForm", "s");
    showhide("divList", "h");
    clearLecturer();
    for (i = 0; i < ele.length; i++) {
        $("#lblhLecturerid").text(ele[i].id == "" ? "0" : ele[i].id);
        $("#lblhsearpersonID").text(ele[i].personalID)
        $("#txtpersonalCode").val(ele[i].personalCode);
        $("#txtuniversityID").val(ele[i].universityID);
        $("#txtposition").val(ele[i].position);
        $("#selDepartment").val(ele[i].department);
        $("#txtqualification").val(ele[i].qualification);
        $("#txtDescription").val(ele[i].description);
        $("#txtmaximumLecturePerDay").val(ele[i].maximumLecturePerDay);
        $("#txtmaxLectureHoursPerDay").val(ele[i].maxLectureHoursPerDay);
        $("#txtmaximumLecturePerCycle").val(ele[i].maximumLecturePerCycle);
        $("#selStatus").val(ele[i].status == "Active" ? "A" : "I");
    }
    showhide('divhover', 'h');
}

function saveLecturer(ele) {
    showhide('divhover', 's');
    var list = {
        id: $("#lblhLecturerid").text()
        , universityID: $("#txtuniversityID").val()
        , personalID: $("#lblhsearpersonID").text()
        , position: $("#txtposition").val()
        , department: $("#selDepartment").val()
        , description: $("#txtDescription").val()
        , maximumLecturePerDay: $("#txtmaximumLecturePerDay").val()
        , maxLectureHoursPerDay: $("#txtmaxLectureHoursPerDay").val()
        , maximumLecturePerCycle: $("#txtmaximumLecturePerCycle").val()
        , qualification: $("#txtqualification").val()
        , status: $("#selStatus").val()
    };
    $.ajax({
        type: "POST",
        url: "Lecturer.aspx/websaveLecturer",
        contentType: "application/json; charset=utf-8",
        data: '{ "list":' + JSON.stringify(list) + '}',
        dataType: "json",
        success: function (response) {
            if (response.d > 0) {
                alert("Lecturer saved successfully")
                closeLecturer();
                getLecturer(0);
            }
            else {
                alert("Somthing went worng, Please try again.");
            }
        },
        failure: function (response) {
            alert("Somthing went worng, Please try again.");
        }
    });
    showhide('divhover', 'h');
}

function selectLecturer(ele) {
    $.ajax({
        type: "POST",
        url: "index.aspx/webselectLecturer",
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if ((response.d).length > 0)
                fillselectLecturerlist(response.d);
            else
                alert("Somthing went worng, Please try again.");
        },
        failure: function (response) {
            alert("Somthing went worng, Please try again.");
        }
    });
}

function fillselectLecturerlist(ele) {
    var listtr = "";
    $('#selclLecturer').empty();
    for (i = 0; i < ele.length; i++) {
        $('#selclLecturer').append($('<option>', {
            value: ele[i].id,
            text: ele[i].universityID + " " + ele[i].personalID
        }));
    }
}

function clearCourse() {
    $("#lblhCourseid").text("0");
    $("#txtCoursecode").val("");
    $("#txtCoursetitle").val("");
    $("#selAssessmentform").val("1");
    $("#txtEctscredit").val("");
    $("#selDepartment").val("1");
    $("#selLabreq").val("1");
    $("#txtmaximumEnrollment").val("");
    $("#txtmaximumDays").val("");
    $("#txtmaximumHourse").val("");
    $("#txtmaximumHoursePerDay").val("");
    $("#txtDescription").val("");
    $("#txtStartingDate").val("");
    $("#txtEndingDate").val("");
    $("#selStatus").val('A');
    $("#lblhLecturerCourseid").text("0");
    $("#lblhmodelCourseid").text("0");
    //$("#selclLecturer").val()
    $("#selclLecturer option:first-child").attr("selected", true);
    $("#txtColorPicker").val("#00aabb");
    $("#txtColorPicker").trigger('change');
    $("#selclStatus").val('A');
}

function closeCourse() {
    clearCourse();
    showhide("divForm", "h");
    showhide("divList", "s");
}

function getCourse(ele) {
    showhide('divhover', 's');
    $.ajax({
        type: "POST",
        url: "index.aspx/webgetCourse",
        data: '{id: ' + ele + ' }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            //$('.show').html(response);
            if (ele == 0)
                fillCourselist(response.d);
            else
                fillCourseform(response.d);
        },
        failure: function (response) {
            alert("Somthing went worng, Please try again.");
        }
    });
}

function deletCourse(ele) {
    $.ajax({
        type: "POST",
        url: "index.aspx/webdeleteCourses",
        data: '{id: ' + ele + ' }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response.d > 0) {
                alert("Course deleted successfully")
                getCourse(0);
            }
            else {
                alert("Somthing went worng, Please try again.");
            }
        },
        failure: function (response) {
            alert("Somthing went worng, Please try again.");
        }
    });
}

function fillCourselist(ele) {

    var listtr = "";
    for (i = 0; i < ele.length; i++) {
        listtr = listtr + "<tr id=''><td>" + (i + 1) + "</td>";
        listtr = listtr + "<td>" + ele[i].courseCode + "</td>";
        listtr = listtr + "<td>" + ele[i].name + "</td>";
        listtr = listtr + "<td>" + ele[i].department + "</td>";
        listtr = listtr + "<td>" + ele[i].ects + "</td>";
        listtr = listtr + "<td>" + ele[i].status + "</td>";
        listtr = listtr + "<td><button type='button' class='btn btn-outline btn-primary btn-circle' onclick='getCourse(" + ele[i].id + ");'><i class='fa fa-pencil'></i></button>";
        listtr = listtr + "<button type='button' class='btn btn-outline btn-danger btn-circle' onclick='deleteCourse(" + ele[i].id + ");'><i class='fa fa-trash-o'></i></button></td></tr>";
    }
    $("#tblCourses").find("tr:gt(0)").remove();
    $('#tblCourses').append(listtr);
    showhide('divhover', 'h');
}

function fillCourseform(ele) {
    showhide("divForm", "s");
    showhide("divList", "h");
    clearCourse();
    for (i = 0; i < ele.length; i++) {

        $("#lblhCourseid").text(ele[i].id == "" ? "0" : ele[i].id);
        $("#txtCoursecode").val(ele[i].courseCode);
        $("#txtCoursetitle").val(ele[i].name);
        $("#selAssessmentform").val(ele[i].types);
        $("#txtEctscredit").val(ele[i].ects);
        $("#selDepartment").val(ele[i].department);
        $("#selLabreq").val(ele[i].labFlag);
        $("#txtmaximumEnrollment").val(ele[i].maximumEnrollment);
        $("#txtmaximumDays").val(ele[i].maximumDaysPerCycle);
        $("#txtmaximumHourse").val(ele[i].maximumHoursPerCycle);
        $("#txtmaximumHoursePerDay").val(ele[i].maximumHoursPerDay);
        $("#txtDescription").val(ele[i].description);
        $("#txtStartingDate").val(ele[i].startingDate);
        $("#txtEndingDate").val(ele[i].endingDate);
        $("#selStatus").val(ele[i].status == "Active" ? "A" : "I");
        $("#lblhLecturerCourseid").text(ele[i].lcid);
        $("#lblhmodelCourseid").text(ele[i].coursesID);
        $("#selclLecturer").val(ele[i].lectureID);
        $("#txtColorPicker").val(ele[i].colorCode);
        $("#txtColorPicker").trigger('change');
        $("#selclStatus").val(ele[i].status == "Active" ? "A" : "I");
    }
    showhide('divhover', 'h');
}

function saveCourses(ele) {
    showhide('divhover', 's');
    var list = {
        id: $("#lblhCourseid").text()
         , courseCode: $("#txtCoursecode").val()
         , name: $("#txtCoursetitle").val()
         , types: $("#selAssessmentform").val()
         , ects: $("#txtEctscredit").val()
         , department: $("#selDepartment").val()
         , labFlag: $("#selLabreq").val()
         , maximumHoursPerCycle: $("#txtmaximumEnrollment").val()
         , maximumDaysPerCycle: $("#txtmaximumDays").val()
         , maximumEnrollment: $("#txtmaximumHourse").val()
         , maximumHoursPerDay: $("#txtmaximumHoursePerDay").val()
         , description: $("#txtDescription").val()
         , startingDate: $("#txtStartingDate").val()
         , endingDate: $("#txtEndingDate").val()
         , status: $("#selStatus").val()
         , lcid: $("#lblhLecturerCourseid").text()
         , coursesID: $("#lblhmodelCourseid").text()
         , lectureID: $("#selclLecturer").val()
         , colorCode: $("#txtColorPicker").val()
         , lcstatus: $("#selclStatus").val()
    };
    $.ajax({
        type: "POST",
        url: "index.aspx/websaveCourses",
        contentType: "application/json; charset=utf-8",
        data: '{ "list":' + JSON.stringify(list) + '}',
        dataType: "json",
        success: function (response) {
            if (response.d > 0) {
                alert("Course saved successfully")
                $('#myModal').modal('hide')
                closeLecturer();
                getCourse(0);

            }
            else {
                alert("Somthing went worng, Please try again.");
            }
        },
        failure: function (response) {
            alert("Somthing went worng, Please try again.");
        }
    });
    showhide('divhover', 'h');
}

function selectCourse(ele) {
    $.ajax({
        type: "POST",
        url: "timeslot.aspx/webselectCourse",
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if ((response.d).length > 0)
                fillselectCourselist(response.d);
            else
                alert("Somthing went worng, Please try again.");
        },
        failure: function (response) {
            alert("Somthing went worng, Please try again.");
        }
    });
}

function fillselectCourselist(ele) {
    $('#selCourseid').empty();
    $('#selCourseid').append($('<option>', {
        value: "0",
        text: "Select"
    }));

    for (i = 0; i < ele.length; i++) {
        $('#selCourseid').append($('<option>', {
            value: ele[i].id,
            text: ele[i].courseCode
        }));
    }
}

function selectedCourse() {
    showhide('divhover', 's');
    var ele = $('#selCourseid').val();
    $.ajax({
        type: "POST",
        url: "timeslot.aspx/webselectedCourse",
        data: '{id: ' + ele + ' }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            fillselectCourseDetails(response.d);
        },
        failure: function (response) {
            alert("Somthing went worng, Please try again.");
        }
    });
}

function fillselectCourseDetails(ele) {
    for (i = 0; i < ele.length; i++) {
        $("#lblhLecturertoCourseid").text(ele[i].lcid);
        $("#lblLecturer").text(ele[i].name);
        $("#lblmaximumDays").text(ele[i].maximumDaysPerCycle);
        $("#lblmaximumHourse").text(ele[i].maximumHoursPerCycle);
        $("#lblmaximumHoursePerDay").text(ele[i].maximumHoursPerDay);
        $("#lblhmaximumHoursePerDay").text(ele[i].maximumHoursPerDay);

    }
    showhide('divhover', 'h');
}

function clearTimeSlot() {
    $("#selCourseid").val("0");
    $("#selday").val("0");
    $("#txtTimefrom").val("");
    $("#txtTimeto").val("");
    $("#txtRoom").val("");
    $("#selStatus").val('A');
}

function closeTimeSlot() {
    clearTimeSlot();
    showhide("divForm", "h");
    showhide("divList", "s");
}

function getHour() {
    showhide('divhover', 's');
    var ele = $('#lblhLecturertoCourseid').text();
    var day = $('#selday').val();
    $.ajax({
        type: "POST",
        url: "timeslot.aspx/webgetHour",
        data: '{id: ' + ele + ', day: ' + day + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            fillHour(response.d);
        },
        failure: function (response) {
            alert("Somthing went worng, Please try again.");
        }
    });
    showhide('divhover', 'h');
}

function fillHour(ele) {
    if (ele != "00:00") {
        $('#lblmaximumHoursePerDay').text($('#lblhmaximumHoursePerDay').text() + ",  Already took " + ele + " Hours");
        $('#lblhtakenHours').text(ele);
        $("#selday").val("0");
    }
    else {
        $('#lblmaximumHoursePerDay').text($('#lblhmaximumHoursePerDay').text());
        $('#lblhtakenHours').text(ele);
        $("#selday").val("0");
    }
}

//function saveTimeSlot() {
//    var timefrom = $('#txtTimefrom').val().replace(':','.');
//    var timeto = $('#txtTimeto').val().replace(':', '.');
//    var maxHour = parseFloat($('#lblhmaximumHoursePerDay').text());
//    var tookHour = parseFloat(($('#lblhtakenHours').text()).replace(":", "."));
//    var pendingHour = maxHour - tookHour;
//    timefrom = timefrom.substring(timefrom.length - 2, timefrom.length) == "AM" ? parseFloat(timefrom.substring(0, timefrom.length - 2)) : parseFloat(timefrom.substring(0, timefrom.length - 2)) + 12;
//    timeto = timeto.substring(timeto.length - 2, timeto.length) == "AM" ? parseFloat(timeto.substring(0, timeto.length - 2)) : parseFloat(timeto.substring(0, timeto.length - 2)) + 12;
//    var timefor = timeto - timefrom;
//    if (timefor > timefrom)
//    {
//        alert("Plese select proper time");
//    }
//    else
//    {
//        saveTimeSlot();
//    }
//}

function getTimeSlot(ele) {
    showhide('divhover', 's');
    $.ajax({
        type: "POST",
        url: "timeslot.aspx/webgetTimeSlot",
        data: '{id: ' + ele + ' }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            //$('.show').html(response);
            if (ele == 0)
                fillTimeSlotlist(response.d);
            else
                fillTimeSlotform(response.d);
        },
        failure: function (response) {
            alert("Somthing went worng, Please try again.");
        }
    });
}

function fillTimeSlotlist(ele) {

    var listtr = "";
    for (i = 0; i < ele.length; i++) {
        listtr = listtr + "<tr id=''><td>" + (i + 1) + "</td>";
        listtr = listtr + "<td>" + ele[i].commonName + "</td>";
        listtr = listtr + "<td>" + ele[i].coursesName + "</td>";
        listtr = listtr + "<td>" + ele[i].dayName + "</td>";
        listtr = listtr + "<td>" + ele[i].timeFrom + "</td>";
        listtr = listtr + "<td>" + ele[i].timeTo + "</td>";
        listtr = listtr + "<td>" + ele[i].status + "</td>";
        listtr = listtr + "<td><button type='button' class='btn btn-outline btn-primary btn-circle' onclick='getTimeSlot(" + ele[i].id + ");'><i class='fa fa-pencil'></i></button>";
        listtr = listtr + "<button type='button' class='btn btn-outline btn-danger btn-circle' onclick='deleteCourse(" + ele[i].id + ");'><i class='fa fa-trash-o'></i></button></td></tr>";
    }
    $("#tblTimeSlot").find("tr:gt(0)").remove();
    $('#tblTimeSlot').append(listtr);
    showhide('divhover', 'h');
}

function fillTimeSlotform(ele) {
    showhide("divForm", "s");
    showhide("divList", "h");
    clearTimeSlot();
    for (i = 0; i < ele.length; i++) {

        $("#lblhTimeSlot").text(ele[i].id == "" ? "0" : ele[i].id);
        $("#lblhLecturertoCourseid").text(ele[i].lecturerToCoursesdId);
        $("#selCourseid").val(ele[i].coursesID);
        $("#lblLecturer").text(ele[i].commonName);
        $("#selday").val(ele[i].day);
        $("#txtTimefrom").val(ele[i].timeFrom);
        $("#txtTimeto").val(ele[i].timeTo);
        $("#txtRoom").val(ele[i].room);
        $("#selclStatus").val(ele[i].status == "Active" ? "A" : "I");
    }
    showhide('divhover', 'h');
}


function saveTimeSlot(ele) {
    showhide('divhover', 's');
    var list = {
        id: $("#lblhTimeSlot").text()
         , lecturerToCoursesdId: $("#lblhLecturertoCourseid").text()
         , day: $("#selday").val()
         , timeFrom: $("#txtTimefrom").val()
         , timeTo: $("#txtTimeto").val()
         , room: $("#txtRoom").val()
         , status: $("#selStatus").val()
    };
    $.ajax({
        type: "POST",
        url: "timeslot.aspx/websaveTimeSlot",
        contentType: "application/json; charset=utf-8",
        data: '{ "list":' + JSON.stringify(list) + '}',
        dataType: "json",
        success: function (response) {
            if (response.d == 2)
            {
                alert("Please Select an available Time slot ");
            }
            else if (response.d > 0) {
                alert("Time Slot saved successfully")
                $('#myModal').modal('hide')
                closeTimeSlot();
                getTimeSlot(0);

            }
            else {
                alert("Somthing went worng, Please try again.");
            }
        },
        failure: function (response) {
            alert("Somthing went worng, Please try again.");
        }
    });
    showhide('divhover', 'h');
}
