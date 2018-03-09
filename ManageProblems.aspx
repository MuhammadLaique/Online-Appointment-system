<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor.Master" AutoEventWireup="true" CodeBehind="ManageProblems.aspx.cs" Inherits="SignalRChat.ManageProblems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
    
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Manage Patient                   
                        <small>Problems</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="index.html">Manage Visits</a></li>
                        <li class="active">Manage Patient Problems</li>
                    </ol>
                </div>
            </div>
    
    
    <div class="form-inline">
        <div class="form-group">
            <label>ProblemType:</label>
            <asp:TextBox ID="tbProblemType" runat="server" Class="form-control" placeholder="Problem Type"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Severity:</label>
            <asp:TextBox ID="tbSeverity" runat="server" Class="form-control" placeholder="Severity" TextMode="Number"></asp:TextBox>
        </div>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    </div>
    <div class="row">&nbsp&nbsp&nbsp&nbsp&nbsp</div>
    <div class="row">
        <div class="col-lg-10">
            <div class="form-group">
            <label>Notes:</label>
            <textarea class="form-control" rows="5" id="taNotes" runat="server"></textarea>
        </div>
        </div>
    </div>
        
        
        <div class="form-group">
            <asp:Button ID="ButtonAdd" runat="server" Text="Add" CssClass="btn btn-success" OnClick="ButtonAdd_Click"/>
        </div>
    <hr />
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header text-danger">Problems for this Particular Visit:</h3>
        </div>
    </div>    
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="ProblemId" OnRowCommand="FireRowCommand" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CssClass="table" EmptyDataText="No Problems" ShowFooter="True">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            
            
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:LinkButton ID="btnMark" runat="server" CommandArgument='<%# Eval("ProblemId") %>' CommandName="MarkAsEnded" Text="MarkAsEnded" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
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
