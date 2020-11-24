<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="timeslot.aspx.cs" Inherits="Time_Table.timeslot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="divList">
        <div class="table-responsive">
            <table class="table table-hover" id="tblTimeSlot">

                <tr>
                    <th>#</th>
                    <th>Lecturer</th>
                    <th>Course</th>
                    <th>Day</th>
                    <th>Time From</th>
                    <th>Time To</th>
                    <th>Status</th>
                    <th>
                        <button type="button" class="btn btn-outline btn-primary btn-circle" onclick="fillCourseform();"><i class="fa fa-plus">&nbsp; Add New</i></button>
                    </th>
                </tr>



            </table>
        </div>
    </div>

    <div id="divForm" class="hidden">
        <div class="form-group col-lg-6">
            <label class="hidden" id="lblhLecturertoCourseid"></label>
            <label class="hidden" id="lblhTimeSlot"></label>
            <label>Course </label>
            <select class="form-control" id="selCourseid" onchange="selectedCourse()">
                <%--<option value="1">Course 01</option>
                <option value="2">Course 02</option>
                <option value="3">Course 03</option>
                <option value="4">Course 04</option>
                <option value="5">Course 05</option>--%>
            </select>
        </div>
        <div class="form-group col-lg-6">
            <label>Lecturer </label>
            <label class="form-control" style="margin-bottom: 0px; font-weight: normal" id="lblLecturer"></label>
        </div>
        <div class="form-group col-lg-6 hidden ">
            <label>Maximum Days </label>
            <label class="form-control" style="margin-bottom: 0px; font-weight: normal" id="lblmaximumDays"></label>
        </div>
        <div class="form-group col-lg-6 hidden">
            <label>Maximum Hours </label>
            <label class="form-control" style="margin-bottom: 0px; font-weight: normal" id="lblmaximumHourse"></label>
        </div>
        <div class="form-group col-lg-6 hidden">
            <label>Maximum Hours Per Day </label>
            <label class="hidden" id="lblhmaximumHoursePerDay"></label>
            <label class="hidden" id="lblhtakenHours"></label>
            <label class="form-control " style="margin-bottom: 0px; font-weight: normal" id="lblmaximumHoursePerDay"></label>
        </div>

        <div class="form-group col-lg-6">
            <label>Day</label>
            <select class="form-control" id="selday" <%--onchange="getHour()"--%>>
                <option value="0">Select</option>
                <option value="1">Monday</option>
                <option value="2">Tuesday</option>
                <option value="3">Wednesday</option>
                <option value="4">Thursday</option>
                <option value="5">Friday</option>
            </select>
        </div>
        <div class="form-group col-lg-6">
            <label>Room Number</label>
            <input class="form-control" placeholder="Room Number" id="txtRoom">
        </div>
        <div class="form-group col-lg-6 bootstrap-timepicker timepicker">
            <label>Starting Time</label>
            <input id="txtTimefrom" type="text" class="form-control input-small">
            <label class="hidden" id="hlblTimefrom">800</label>
        </div>
        <div class="form-group col-lg-6">
            <label>Ending Time</label>
            <input id="txtTimeto" type="text" class="form-control input-small">
            <label class="hidden" id="hlblTimeto">2100</label>
        </div>

        <div class="form-group col-lg-6">
            <label>Status</label>
            <select class="form-control" id="selStatus">
                <option value="A">Active</option>
                <option value="I">Inactive</option>
            </select>

        </div>
        <div class="col-lg-6" style="text-align: right; padding: 10px 0 0 0">
            <div class="btn btn-default" onclick="clearTimeSlot()" id="btnClear"><i class="fa fa-refresh">&nbsp;Clear</i></div>
            <div class="btn btn-primary" onclick="closeTimeSlot()" id="btnClose"><i class="fa fa-times">&nbsp;Close</i></div>
            <div class="btn btn-success" onclick="saveTimeSlot()" id="btnSave"><i class="fa fa-floppy-o">&nbsp;Save</i></div>
        </div>
    </div>
    <%--Script--%>
    <script type="text/javascript">
        document.getElementById("timeSlot").className += " active "
        document.getElementById("headh").innerHTML = "Time Slot";
        $(document).ready(function () {
            $('#txtTimefrom').timepicker(
                'setTime', '8:00 AM').on('changeTime.timepicker', function (e) {
                    var hour = e.time.hours;
                    if (e.time.meridian === "PM" && hour !== 12) {
                        hour += 12;
                    }
                    if (hour < 8 || hour > 21) {
                        if (hour < 8) {
                            $('#txtTimefrom').timepicker('setTime', '8:' + e.time.minutes + ' AM');
                        }
                        else if (hour > 21) {
                            $('#txtTimefrom').timepicker('setTime', '8:' + e.time.minutes + ' PM');
                        }
                    }
                    else {
                        var mint = e.time.minutes;
                        alert(min);
                        $('#hlblTimefrom').text((hour.length > 1 ? hour : hour + '0') + '' + (mint.length > 1 ? mint : mint + '0'));
                        var frtym = $('#hlblTimefrom').text().replace(':', '.'); //$('#hlblTimefrom').text();
                        var totym = $('#hlblTimeto').text().replace(':', '.'); //$('#hlblTimeto').text();
                        if (parseFloat(frtym) > parseFloat(totym)) {
                            alert(parseFloat(frtym) + ", " + parseFloat(totym) + ", " + mint.length);
                            var shortText = $('#txtTimefrom').val();
                            $('#txtTimeto').timepicker('setTime', shortText);
                        }
                    }
                });
            $('#txtTimeto').timepicker(
                'setTime', '9:00 PM').on('changeTime.timepicker', function (e) {
                    var hour = e.time.hours;
                    if (e.time.meridian === "PM" && hour !== 12) {
                        hour += 12;
                    }
                    if (hour < 8 || hour > 21) {
                        if (hour < 8) {
                            $('#txtTimeto').timepicker('setTime', '8:' + e.time.minutes + ' AM');
                        }
                        else if (hour > 21) {
                            $('#txtTimeto').timepicker('setTime', '8:' + e.time.minutes + ' PM');
                        }
                    }
                    else {
                        var mint = e.time.minutes;
                        $('#hlblTimeto').text((hour.length > 1 ? hour : hour + '0') + '' + (mint.length > 1 ? mint : mint + '0'));
                        var frtym = $('#hlblTimefrom').text().replace(':', '.'); //$('#hlblTimefrom').text();
                        var totym = $('#hlblTimeto').text().replace(':', '.'); //$('#hlblTimeto').text();
                        if (parseFloat(frtym) > parseFloat(totym)) {
                            alert(parseFloat(frtym) + ", " + parseFloat(totym) + ", " + mint.length);
                            var shortText = $('#txtTimeto').val();
                            $('#txtTimefrom').timepicker('setTime', shortText);
                        }
                    }
                });

            selectCourse();
            getTimeSlot(0);
        });
    </script>
</asp:Content>
