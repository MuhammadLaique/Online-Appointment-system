<%@ Page Title="" Language="C#" MasterPageFile="~/Patient.Master" AutoEventWireup="true" CodeBehind="PatientHome.aspx.cs" Inherits="SignalRChat.PatientHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Welcome                  
                        <small><%=Session["Name"] %> </small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li class="active"></li>
                    </ol>
                </div>
            </div>
       </div>
</asp:Content>
