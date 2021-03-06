﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor.Master" AutoEventWireup="true" CodeBehind="DoctorProfileBuilderPage.aspx.cs" Inherits="SignalRChat.DoctorProfileBuilderPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= ddlcity2.ClientID %>').on('change', function () {
                if (this.value == 'Other' || this.value == 'Select City')
                    //.....................^.......
                {
                    $("#Optional2").show();
                    $("#Optional1").hide();
                }
                else {
                    $("#Optional1").show();
                    $("#Optional2").hide();
                }
            });
        });

        $(document).ready(function () {
            $('#<%= ddlcategory.ClientID %>').on('change', function () {
                if (this.value == 'Other' || this.value == 'Select Category')
                    //.....................^.......
                {
                    $("#Optional3").show();
                    $("#Optional1").hide();
                }
                else {
                    $("#Optional1").show();
                    $("#Optional3").hide();
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Profile
                   
                        <small>Update</small>
                    </h1>
                    <ol class="breadcrumb">
                    <li><a href="#">SignUp Request</a></li>
                    <li><a href="#">UserAccount</a></li>
                    <li class="active">ProfileUpdate</li>
                </ol>
                </div>
            </div>     
        <div class="form-inline">
            <div class="form-group">
                <label>Name:</label>
                <asp:TextBox ID="TextBoxName" runat="server" Class="form-control" placeholder="Name" required="required"></asp:TextBox>
                 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            </div>
            <div class="form-group">
                <label>DateOfBirth:</label>
                <asp:TextBox ID="TextBoxDOB" runat="server" Class="form-control" placeholder="DateOfBirth" required="required" TextMode="Date"></asp:TextBox>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            </div>
            <div class="form-group">
                <label>Gender:</label>
                <select runat="server" class="form-control" id="selectGender" required="required" >
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                </select>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            </div>
            <div class="form-group">
                <label>Phone1:</label>
                <asp:TextBox ID="TextBoxPhone1" runat="server" Class="form-control" placeholder="Phone 1" TextMode="Phone" required="required"></asp:TextBox>
            </div>
        </div>
       <hr />
       <div class="form-inline">
            <div class="form-group">
                <label>EmailPrimary:</label>
                <asp:TextBox ID="TextBoxEmailPrimary" runat="server" Class="form-control" placeholder="Email Primary" TextMode="Email" required="required"></asp:TextBox>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            </div>
            <div class="form-group">
                <label>EmailSecondary (Optional):</label>
                <asp:TextBox ID="TextBoxEmailSecondary" runat="server" Class="form-control" placeholder="Email Secondary" TextMode="Email" required="required"></asp:TextBox>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            </div>                       
            <div class="form-group">
                <label>Phone2:</label>
                <asp:TextBox ID="TextBoxPhone2" runat="server" Class="form-control" placeholder="Phone2" TextMode="Phone" required="required"></asp:TextBox>
            </div>
        </div>
       <hr />
        <div class="form-inline">
            <div class="form-group">
                <label>Your Minimum Fee:</label>
                <asp:TextBox ID="TextBoxFeeMin" runat="server" Class="form-control" placeholder="Your Minimum Fee" TextMode="Number" required="required"></asp:TextBox>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            </div>                          
            <div class="form-group">
                <label>Your Maximum Fee:</label>
                <asp:TextBox ID="TextBoxFeeMax" runat="server" Class="form-control" placeholder="Your Maximum Fee" TextMode="Number" required="required"></asp:TextBox>
            </div>
        </div>
       <hr />
       <div class="form-inline">
            <div class="form-group">
                <label>City:</label>
              <%--<asp:DropDownList ID="ddlcity" runat="server" ToolTip="If Desired City is not in the list. Select &quot;Other&quot; option and add new City."></asp:DropDownList>--%>
            <select id="ddlcity2" runat="server" tooltip="Select other"></select>
            </div>          
            <div id="Optional2" style="display:none" class="form-inline">
                 <hr />
            <div class="form-group">
                <label>New City Name:</label>
                <asp:TextBox ID="TextBoxCity" runat="server" Class="form-control" placeholder="City Name"></asp:TextBox>
                <asp:Button ID="ButtonAddCity" runat="server" Text="Add City" CssClass="btn btn-success" OnClick="ButtonAddCity_Click"/>               
            </div>
                <hr />
            </div>
       
            <div class="form-group">
                <label>Specialization:</label>
                <asp:DropDownList ID="ddlcategory" runat="server" ToolTip="If Desired Category is not in the list. Select &quot;Other&quot; option and add new Category."></asp:DropDownList>
            </div>
            <div id="Optional3" style="display:none" class="form-inline">
                <hr />
            <div class="form-group">
                <label>New Category Name:</label>
                <asp:TextBox ID="TextBoxCategory" runat="server" Class="form-control" placeholder="Category Name"></asp:TextBox>
                <asp:Button ID="ButtonAddCategory" runat="server" Text="Add Category" CssClass="btn btn-success" OnClick="ButtonAddCategory_Click"/>
            </div>
                <hr />
             </div>
        </div>
            <hr />
       <div class="form-inline">
            <div class="form-group">
                <label>Qualification:</label>
                <asp:TextBox ID="TextBoxQualification" runat="server" Class="form-control" placeholder="Add with Commas" required="required"></asp:TextBox>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            </div>
            <div class="form-group">
                <label>Experience (Years):</label>
                <asp:TextBox ID="TextBoxExperience" runat="server" Class="form-control" placeholder="Experience Years" TextMode="Number"  required="required"></asp:TextBox>
            </div>
        </div>
       <hr />
            <div class="form-group">
                <label>Address (Residence):</label>
                <asp:TextBox ID="TextBoxAddressPersonal" runat="server" Class="form-control" placeholder="Address Personal" required="required"></asp:TextBox>
            </div>
            <div id="Optional1" class="form-group">
                <asp:Button ID="ButtonSubmitProfile" runat="server" Class="btn btn-success" Text="Submit Profile" OnClick="ButtonSubmitProfile_Click" />              
            </div>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>       
    </div>
</asp:Content>
