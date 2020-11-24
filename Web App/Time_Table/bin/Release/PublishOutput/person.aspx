<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="person.aspx.cs" Inherits="Time_Table.person" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="divList">
        <div class="table-responsive">
            <table class="table table-hover" id="tblPerson">

                <tr>
                    <th>#</th>
                    <th>code</th>
                    <th>Name</th>
                    <th>Contact No</th>
                    <th>Email</th>
                    <th>Status</th>
                    <th>
                        <button type="button" class="btn btn-outline btn-primary btn-circle" onclick="fillPersonform();"><i class="fa fa-plus">&nbsp; Add New</i></button></th>
                </tr>


            </table>
        </div>
    </div>
    <div id="divForm" class="hidden">
        <div class="form-group col-lg-6">
            <label class="hidden" id="lblhPersonid"></label>
            <label>Person code</label>
            <input class="form-control" placeholder="Person code" id="txtPersoncode">
        </div>
        <div class="form-group col-lg-6">
            <label>Common Name</label>
            <input class="form-control" placeholder="Common Name" id="txtCommonName">
        </div>
        <div class="form-group col-lg-6">
            <label>Given Name</label>
            <input class="form-control" placeholder="Given Name" id="txtGivenName">
        </div>

        <div class="form-group col-lg-6">
            <label>Middle Name</label>
            <input class="form-control" placeholder="Middle Name" id="txtMiddleName">
        </div>
        <div class="form-group col-lg-6 concode-select">
            <label>Contact Number </label>
            <div class="col-lg-12" style="padding: 0px">
                <div class="col-sm-4 col-xs-5" style="padding: 0; max-width: 100px; min-width: 100px;">
                    <input class="form-control" id="txtconcode">
                </div>
                <div class="col-sm-8 col-xs-7" style="width: calc(100% - 100px); padding: 0;">
                    <input class="form-control" placeholder="Contact Number" id="txtContactNumber" onkeydown="isnumber(this);">
                </div>
            </div>
        </div>
        <div class="form-group col-lg-6">
            <label>E-Mail</label>
            <input class="form-control" placeholder="E-Mail" id="txEMail" onblur="isEmail(this);">
        </div>
        <div class="form-group col-lg-6">
            <label>Date of Birth </label>
            <div class='input-group date' id='dtpdob'>
                <input type='text' class="form-control" id="txtdob" />
                <span class="input-group-addon">
                    <span class="fa fa-calendar"></span>
                </span>
            </div>
        </div>
        <div class="form-group col-lg-6">
            <label>Gender</label>
            <select class="form-control" id="selGender">
                <option value="M">Male</option>
                <option value="F">Female</option>
            </select>
        </div>
        <div class="form-group col-lg-6">
            <label>Address Line 01 </label>
            <input class="form-control" placeholder="Address Line 01" id="txtAddress1">
        </div>
        <div class="form-group col-lg-6">
            <label>Address Line 02 </label>
            <input class="form-control" placeholder="Address Line 02" id="txtAddress2">
        </div>
        <div class="form-group col-lg-6">
            <label>City</label>
            <input class="form-control" placeholder="City" id="txtCity">
        </div>
        <div class="form-group col-lg-6">
            <label>Country </label>
            <input class="form-control" placeholder="Country" id="txtCountry">
        </div>
        <div class="form-group col-lg-6">
            <label>Zip Code </label>
            <input class="form-control" placeholder="Zip Code" id="txtZipCode">
        </div>

        <%-- <div class="form-group col-lg-6">
            <label>User Name </label>
            <input class="form-control" placeholder="User Name" id="txtUserName">
        </div>
        <div class="form-group col-lg-6">
            <label>Password </label>
            <input class="form-control" type="password" placeholder="Password" id="txtPassword">
        </div>
        <div class="form-group col-lg-6">
            <label>Confirm  Password</label>
            <input class="form-control" type="password" placeholder="Confirm Password" id="txtcPassword" onblur="checkPassword()">
        </div>--%>
        <div class="form-group col-lg-6">
            <label>Status</label>
            <select class="form-control" id="selStatus">
                <option value="A">Active</option>
                <option value="I">Inactive</option>
            </select>

            <div class="col-lg-12" style="text-align: right; padding: 10px 0 0 0">
                <div class="btn btn-default" id="btnClear"><i class="fa fa-refresh" onclick="clearPerson()">&nbsp;Clear</i></div>
                <div class="btn btn-primary" id="btnClose"><i class="fa fa-times" onclick="closePerson()">&nbsp;Close</i></div>
                <div class="btn btn-success" id="btnSave" onclick="savePerson()"><i class="fa fa-floppy-o">&nbsp;Save</i></div>
            </div>
        </div>
    </div>
    <%--Script--%>
    <script type="text/javascript">
        document.getElementById("person").className += " active "
        document.getElementById("headh").innerHTML = "Person Details";

        $(document).ready(function () {
            $("#dtpdob").datepicker('setEndDate', new Date());               
            $("#txtconcode").concodeSelect({
                //defaultCountry: "jp",
                //onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
                preferredconcodes: ['ee']
            });
            $("#txtCountry").countrySelect({
                //defaultCountry: "jp",
                //onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
                preferredCountries: ['ee', 'ca', 'gb', 'us']
            });
            getPerson(0);
        });


    </script>
</asp:Content>
