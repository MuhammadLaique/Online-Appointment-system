<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor.Master" AutoEventWireup="true" CodeBehind="ManageSchedule.aspx.cs" Inherits="SignalRChat.UpdateSchedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Schedule
                   
                        <small>Update</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li><a href="#">Affiliations</a>
                        </li>
                        <li class="active">Schedule Update</li>
                    </ol>
                </div>
            </div>       

     
            <div class="form-horizontal">
                <h2>Choose New Schedule:</h2>
                <hr />  
                <div class="form-group">
                    <div class="text-center"><label>Monday:</label></div>
                    <label>From:</label>
                     <asp:TextBox ID="tbmonfrom" runat="server" Class="form-control" TextMode="Time"></asp:TextBox>                                                       
                    <label>To:</label>
                     <asp:TextBox ID="tbmonto" runat="server" Class="form-control"  TextMode="Time"></asp:TextBox> 
                </div>
                <div class="form-group">
                    <div class="text-center"><label>Tuesday:</label></div>
                    <label>From:</label>
                     <asp:TextBox ID="tbtuefrom" runat="server" Class="form-control"  TextMode="Time"></asp:TextBox>                                                       
                    <label>To:</label>
                     <asp:TextBox ID="tbtueto" runat="server" Class="form-control"  TextMode="Time"></asp:TextBox> 
                </div>
                <div class="form-group">
                    <div class="text-center"><label>Wednesday:</label></div>
                    <label>From:</label>
                     <asp:TextBox ID="tbwedfrom" runat="server" Class="form-control"  TextMode="Time"></asp:TextBox>                                                       
                    <label>To:</label>
                     <asp:TextBox ID="tbwedto" runat="server" Class="form-control"  TextMode="Time"></asp:TextBox> 
                </div>
                <div class="form-group">
                    <div class="text-center"><label>Thursday:</label></div>
                    <label>From:</label>
                     <asp:TextBox ID="tbthufrom" runat="server" Class="form-control"  TextMode="Time"></asp:TextBox>                                                       
                    <label>To:</label>
                     <asp:TextBox ID="tbthuto" runat="server" Class="form-control"  TextMode="Time"></asp:TextBox> 
                </div>
                <div class="form-group">
                    <div class="text-center"><label>Friday:</label></div>
                    <label>From:</label>
                     <asp:TextBox ID="tbfrifrom" runat="server" Class="form-control"  TextMode="Time"></asp:TextBox>                                                       
                    <label>To:</label>
                     <asp:TextBox ID="tbfrito" runat="server" Class="form-control"  TextMode="Time"></asp:TextBox> 
                </div>
                <div class="form-group">
                    <div class="text-center"><label>Saturday:</label></div>
                    <label>From:</label>
                     <asp:TextBox ID="tbsatfrom" runat="server" Class="form-control"  TextMode="Time"></asp:TextBox>                                                       
                    <label>To:</label>
                     <asp:TextBox ID="tbsatto" runat="server" Class="form-control"  TextMode="Time"></asp:TextBox> 
                </div>
                <div class="form-group">
                    <div class="text-center"><label>Sunday:</label></div>
                    <label>From:</label>
                     <asp:TextBox ID="tbsunfrom" runat="server" Class="form-control"  TextMode="Time"></asp:TextBox>                                                       
                    <label>To:</label>
                     <asp:TextBox ID="tbsunto" runat="server" Class="form-control"  TextMode="Time"></asp:TextBox> 
                </div>
                 <div class="form-group">
                        <asp:Button ID="ButtonSelect" runat="server" Text="Select" CssClass="btn btn-success" OnClick="ButtonSelect_Click" />
                </div>
    </div>
         </div>
</asp:Content>
