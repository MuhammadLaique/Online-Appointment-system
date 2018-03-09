<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="SignalRChat.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">       
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Recover Password                 
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li><a href="#">Login</a>
                        </li>
                        <li class="active">ForgotPassword</li>
                    </ol>
                </div>
            </div>
            <div class="form-horizontal">              
                <h4>Please enter your email address, We will send you the instrutions to reset your password.</h4>
                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server" CssClass="col-md-2 control-label" Text="Your Email"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="tbEmailId" CssClass="form-control" runat="server" required="required"></asp:TextBox>                     
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btPassRec" runat="server" CssClass="btn btn-danger" Text="Send" OnClick="btPassRec_Click" />
                        <asp:Label ID="lblPassRec" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
