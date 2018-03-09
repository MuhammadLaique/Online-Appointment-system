<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor.Master" AutoEventWireup="true" CodeBehind="ManageTestReports.aspx.cs" Inherits="SignalRChat.ManageTestReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Manage patient
                   
                        <small>Test Reports</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li><a href="#">Manage Visits</a>
                        </li>
                        <li class="active">Manage Test Reports</li>
                    </ol>
                </div>
            </div>
       

     <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header text-danger">Add new Test Report for this Patient:</h3>
        </div>
    </div>
    <div class="form-inline">
        <div class="form-group">
            <label>TestName:</label>
            <asp:TextBox ID="tbName" runat="server" Class="form-control" placeholder="Test Name"></asp:TextBox>
        </div>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <div class="form-group">
            <label>TestDate:</label>
            <asp:TextBox ID="tbDate" runat="server" Class="form-control" placeholder="Test Date" TextMode="Date"></asp:TextBox>
        </div>
    </div>
    <div class="row">
    <div class="form-group">
            <label>Test Report:</label>
            <textarea class="form-control" rows="5" id="taReport" runat="server"></textarea>
        </div>
        <div class="form-group">
            <label>Test Result:</label>
            <textarea class="form-control" rows="5" id="taResult" runat="server"></textarea>
        </div>
        
        <div class="form-group">
            <asp:Button ID="ButtonAdd" runat="server" Text="Add" CssClass="btn btn-success" OnClick="ButtonAdd_Click"/>
        </div>
    </div>
      
    <hr />
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header text-danger">Test Reports for this Particular Visit:</h3>
        </div>
    </div>
    
           
    <asp:GridView ID="GridView1" runat="server" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CssClass="table" EmptyDataText="No Tests" ShowFooter="True">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
        </div>
</asp:Content>
