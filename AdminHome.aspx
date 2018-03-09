<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="SignalRChat.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Welcome <%=Session["Name"] %>                   
                        <small>Admin</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li class="active">Admin Home</li>
                    </ol>
                </div>
            </div>
       </div>
</asp:Content>
