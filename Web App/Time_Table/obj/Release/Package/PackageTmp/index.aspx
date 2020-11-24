<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Time_Table.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="divList">
        <div class="table-responsive">
            <table class="table table-hover" id="tblCourses">

                <tr>
                    <th>#</th>
                    <th>Course code</th>
                    <th>Course title</th>
                    <th>Department</th>
                    <th>ECTS</th>
                    <th>Status</th>
                    <th>
                        <button type="button" class="btn btn-outline btn-primary btn-circle" onclick="fillCourseform();"><i class="fa fa-plus">&nbsp; Add New</i></button></th>
                </tr>

                

            </table>
        </div>
    </div>
    <div id="divForm" class="hidden">
        <div class="form-group col-lg-6">
            <label class="hidden" id="lblhCourseid">0</label>
            <label>Course code</label>
            <input class="form-control" placeholder="Course code" id="txtCoursecode">
        </div>
        <div class="form-group col-lg-6">
            <label>Course title</label>
            <input class="form-control" placeholder="Course title" id="txtCoursetitle">
        </div>
        <div class="form-group col-lg-6">
            <label>ECTS credits</label>
            <input class="form-control" placeholder="ECTS credits" id="txtEctscredit" onkeydown="isfloat(this)">
        </div>

        <div class="form-group col-lg-6">
            <label>Department</label>
            <select class="form-control" id="selDepartment">
                <option value="1">ESTONIAN MARITIME ACADEMY</option>
                <option value="2">SCHOOL OF BUSINESS AND GOVERNANCE</option>
                <option value="3">SCHOOL OF ENGINEERING</option>
                <option value="4">SCHOOL OF INFORMATION TECHNOLOGIES</option>
                <option value="5">SCHOOL OF SCIENCE</option>
            </select>
        </div>
        <div class="form-group col-lg-6">
            <label>Assessment form</label>
            <select class="form-control" id="selAssessmentform">
                <option value="1">Examination</option>
                <option value="2">Pass/fail assessment</option>
            </select>
        </div>
        <div class="form-group col-lg-6">
            <label>Lab</label>
            <select class="form-control" id="selLabreq">
                <option value="1">Required</option>
                <option value="2">Not required</option>
            </select>
        </div>
        <div class="form-group col-lg-6">
            <label>Maximum Enrollment </label>
            <input class="form-control" placeholder="Maximum Enrollment" id="txtmaximumEnrollment" onkeydown="isnumber(this)">
        </div>
        <div class="form-group col-lg-6">
            <label>Maximum Days </label>
            <input class="form-control" placeholder="Maximum Days" id="txtmaximumDays" onkeydown="isnumber(this)">
        </div>
        <div class="form-group col-lg-6">
            <label>Maximum Hourse </label>
            <input class="form-control" placeholder="Maximum Hourse" id="txtmaximumHourse" onkeydown="isfloat(this)">
        </div>
        <div class="form-group col-lg-6">
            <label>Maximum Hourse Per Day </label>
            <input class="form-control" placeholder="Maximum Hourse Per Day" id="txtmaximumHoursePerDay" onkeydown="isfloat(this)">
        </div>
        <div class="form-group col-lg-6">
            <label>Starting Date </label>
            <div class='input-group date' id='dtpStartingDate'>
                <input type='text' class="form-control" id="txtStartingDate" />
                <span class="input-group-addon">
                    <span class="fa fa-calendar"></span>
                </span>
            </div>
        </div>
        <div class="form-group col-lg-6">
            <label>Ending Date </label>
            <div class='input-group date' id='dtpEndingDate'>
                <input type='text' class="form-control" id="txtEndingDate" />
                <span class="input-group-addon">
                    <span class="fa fa-calendar"></span>
                </span>
            </div>
        </div>
        <div class="form-group col-lg-6">
            <label>Description </label>
            <textarea class="form-control" rows="3" id="txtDescription"></textarea>
        </div>
        <div class="form-group col-lg-6">
            <label>Status</label>
            <select class="form-control" id="selStatus">
                <option value="A">Active</option>
                <option value="I">Inactive</option>
            </select>
            <div class="col-lg-12" style="text-align: right; padding: 10px 0 0 0">
                <div class="btn btn-default" id="btnClear" onclick="clearCourse()"><i class="fa fa-refresh">&nbsp;Clear</i></div>
                <div class="btn btn-primary" id="btnClose" onclick="closeCourse()"><i class="fa fa-times">&nbsp;Close</i></div>
                <div class="btn btn-success" id="btnSave" data-toggle="modal" data-target="#myModal"><i class="fa fa-chevron-right">&nbsp;Next</i></div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Select the Lecturer</h4>
                    <label class="hidden" id="lblhLecturerCourseid">0</label>
                    <label class="hidden" id="lblhmodelCourseid">0</label>
                </div>
                <div class="modal-body">
                    <div class="form-group col-lg-6">
                        <label>Lecturer</label>
                        <select class="form-control" id="selclLecturer">
                            
                            
                        </select>
                    </div>
                   <div class="form-group col-lg-6">
                        <label>Color</label>
                        <div id="cp2" class="input-group colorpicker-component">
                            <input type="text" value="#00AABB" class="form-control" id="txtColorPicker" />
                            <span class="input-group-addon"><i></i></span>
                        </div>
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Status</label>
                        <select class="form-control" id="selclStatus">
                            <option value="A">Active</option>
                            <option value="I">Inactive</option>
                        </select>
                    </div>
                    <div class="form-group col-lg-6" style="text-align: right; padding: 25px 0 0 0">
                        <%--<div class="btn btn-default" id="btnclClear" onclick="clearCourse()"><i class="fa fa-refresh">&nbsp;Clear</i></div>--%>
                        <div class="btn btn-primary" id="btnclClose" data-dismiss="modal"><i class="fa fa-times">&nbsp;Close</i></div>
                        <div class="btn btn-success" id="btnclSave" onclick="saveCourses()"><i class="fa fa-floppy-o">&nbsp;Save</i></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="modal-footer">
                    <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
                </div>
            </div>

        </div>
    </div>
    <%--Script--%>
    <script type="text/javascript">
        document.getElementById("Courses").className += " active "
        document.getElementById("headh").innerHTML = "Courses";
       
        $(document).ready(function () {

            $("#dtpStartingDate").datepicker({
                //todayBtn: 1,
                autoclose: true,
            }).on('changeDate', function (selected) {
                var minDate = new Date(selected.date.valueOf());
                $('#dtpEndingDate').datepicker('setStartDate', minDate);
            });

            $("#dtpEndingDate").datepicker({
                //todayBtn: 1,
                autoclose: true,
            }).on('changeDate', function (selected) {
                var maxDate = new Date(selected.date.valueOf());
                $('#dtpStartingDate').datepicker('setEndDate', maxDate);
            });
            $('#cp2').colorpicker();
            selectLecturer();
            getCourse(0);
        });
    </script>
</asp:Content>
