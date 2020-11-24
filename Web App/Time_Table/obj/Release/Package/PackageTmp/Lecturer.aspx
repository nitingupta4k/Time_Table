<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Lecturer.aspx.cs" Inherits="Time_Table.Lecturer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="divList">
        <div class="table-responsive">
            <table class="table table-hover" id="tblLecturer">

                <tr>
                    <th>#</th>
                    <th>Personal code</th>
                    <th>University Code</th>
                    <th>Position</th>
                    <th>Department</th>
                    <th>Status</th>
                    <th>
                        <button type="button" class="btn btn-outline btn-primary btn-circle" onclick="fillLecturerform();"><i class="fa fa-plus">&nbsp; Add New</i></button>
                    </th>
                </tr>               

            </table>
        </div>
    </div>

    <div id="divForm" class="hidden">
        <div class="form-group col-lg-6">
            <label class="hidden" id="lblhLecturerid">0</label>
            <label>Personal code</label>
            <input class="form-control" placeholder="Personal Code" id="txtpersonalCode" onkeyup="serchPerson('txtpersonalCode');">
            <label class="hidden" id="lblhsearpersonID"></label>
            <ul class="ul_Advancelist hidden" id="personSearchul">
            </ul>
        </div>
        <div class="form-group col-lg-6">
            <label>University Code</label>
            <input class="form-control" placeholder="University Code" id="txtuniversityID">
        </div>
        <div class="form-group col-lg-6">
            <label>Position</label>
            <input class="form-control" placeholder="Position" id="txtposition">
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
            <label>Qualification</label>
            <input class="form-control" placeholder="Qualification" id="txtqualification">
        </div>
        <div class="form-group col-lg-6">
            <label>Max. Lecture Per Day</label>
            <input class="form-control" placeholder="Max. Lecture Per Day" id="txtmaximumLecturePerDay" onkeydown="isnumber(this);">
        </div>
        <div class="form-group col-lg-6">
            <label>Max. Hours Per Day</label>
            <input class="form-control" placeholder="Max. Hours Per Day" id="txtmaxLectureHoursPerDay" onkeydown="isfloat(this);" onkeyup="checkValLimit('txtmaxLectureHoursPerDay')">
        </div>

        <div class="form-group col-lg-6">
            <label>Max. Lectures Per Cycle</label>
            <input class="form-control" placeholder="Max. Lectures Per Cycle" id="txtmaximumLecturePerCycle" onkeydown="isnumber(this);">
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
                <div class="btn btn-default" id="btnClear"><i class="fa fa-refresh" onclick="clearLecturer()">&nbsp;Clear</i></div>
                <div class="btn btn-primary" id="btnClose"><i class="fa fa-times" onclick="closeLecturer()">&nbsp;Close</i></div>
                <div class="btn btn-success" id="btnSave" onclick="saveLecturer()"><i class="fa fa-floppy-o">&nbsp;Save</i></div>
            </div>
        </div>
    </div>

    <%--Script--%>
    <script type="text/javascript">
        document.getElementById("Lecturer").className += " active "
        document.getElementById("headh").innerHTML = "Lecturer";
        $(document).ready(function () {
            getLecturer('0');
        });
    </script>
</asp:Content>
