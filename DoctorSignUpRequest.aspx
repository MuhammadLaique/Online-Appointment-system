<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="DoctorSignUpRequest.aspx.cs" Inherits="SignalRChat.DoctorSignUpRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
         <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">SignUp 
                   
                        <small>Request</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li class="active"></li>SignUp Request
                    </ol>
                </div>
            </div>
       </div>
        <div class="form-horizontal">
            
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="TextBoxName" runat="server" Class="form-control" placeholder="Name" ToolTip="  Enter Your Complete Name  " required="required"></asp:TextBox>                             
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Email"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="TextBoxEmail" runat="server" Class="form-control" placeholder="Email" TextMode="Email" ToolTip="  Enter Your Active Email  " required="required"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" CssClass="col-md-2 control-label" Text="Phone"></asp:Label>
                <div class="col-md-3">
                   <asp:TextBox ID="TextBoxPhone" runat="server" Class="form-control" placeholder="Phone" TextMode="Phone" ToolTip="    Enter Your Active Phone No." required="required"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Message"></asp:Label>
                <div class="col-md-6">
                   <textarea id="taMessage" runat="server" rows="5" class="form-control" placeholder="Message" ></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btSignup" runat="server" Class="btn btn-warning" Text="Send" OnClick="btSignup_Click" />
                </div>
            </div>
        </div>
        <!-- Sign Up -->
</asp:Content>
