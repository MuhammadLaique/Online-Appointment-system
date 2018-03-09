<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor.Master" AutoEventWireup="true" CodeBehind="ManageVisits.aspx.cs" Inherits="SignalRChat.ManageVisits" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Manage Patient
                   
                        <small>Visits</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li class="active">Visits</li>
                    </ol>
                </div>
            </div>
              
    <div class="form-horizontal">
        <div class="form-group">
            <div class="col-md-1"></div>
            <div class="col-md-2">
                <label for="UserNamem">Patients Name:</label>
                <input class="form-control" id="tbName" type="text" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-1"></div>
            <div class="col-md-2">
                <label for="UserNamem">Main Issue:</label>
                <input class="form-control" id="tbIssue" type="text" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-1"></div>
            <div class="col-md-6">
                <label for="comment">Symptoms:</label>
                <textarea class="form-control" rows="5" id="taSymptoms" runat="server"></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-1"></div>
            <div class="col-md-6">
                <label for="comment">Description:</label>
                <textarea class="form-control" rows="5" id="taDescription" runat="server"></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-2"></div>
            <div class="col-md-6">
                <asp:Button ID="ButtonAdd" runat="server" Text="Add To Patients List" CssClass="btn btn-success" OnClick="Button1_Click" />
                <asp:Label ID="lblMsg" runat="server" CssClass="text-danger"></asp:Label>
            </div>
        </div>
        

    </div>
    <hr />
    <%--<div class="col-lg-4 col-lg-offset-2">
    <--%>
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Your Patients:</h3>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-1"></div>
        <div class="col-md-6">
            <asp:GridView ID="GridView1" runat="server" CssClass="table" DataKeyNames="VisitID" OnRowCommand="FireRowCommand" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" EmptyDataText="No Visits" ShowFooter="True">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnTest" runat="server" CommandArgument='<%# Eval("VisitId") %>'
                                CommandName="ManageTestReports" Text="Test Reports" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btnPrescription" runat="server" CommandArgument='<%# Eval("VisitId") %>'
                                CommandName="ManagePrescriptions" Text="Prescriptions" />

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btnProblems" runat="server" CommandArgument='<%# Eval("VisitId") %>'
                                CommandName="ManageProblems" Text="Sub-Problems" />

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
    </div>
        <div class="form-group">
            <div class="col-md-2"></div>
            <div class="col-md-6">
                <asp:LinkButton ID="ButtonAddExternal" runat="server" Text="Add External Patient" CssClass="btn btn-success" OnClick="ButtonAddExternal_Click" />
            </div>
        </div>
 </div>
</asp:Content>
