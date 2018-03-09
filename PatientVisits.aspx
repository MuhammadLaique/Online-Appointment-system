<%@ Page Title="" Language="C#" MasterPageFile="~/Patient.Master" AutoEventWireup="true" CodeBehind="PatientVisits.aspx.cs" Inherits="SignalRChat.PatientVisits" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Medical
                   
                        <small>Visits</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li class="active">Visits</li>
                    </ol>
                </div>
            </div>
      
    <asp:GridView ID="GridView1" runat="server" CssClass="table" DataKeyNames="VisitID" OnRowCommand="FireRowCommand" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" EmptyDataText="No Visits" ShowFooter="True">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnTest" runat="server" CommandArgument='<%# Eval("VisitId") %>'
                                CommandName="ViewTestReports" Text="Test Reports" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btnPrescription" runat="server" CommandArgument='<%# Eval("VisitId") %>'
                                CommandName="ViewPrescriptions" Text="Prescriptions" />

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btnProblems" runat="server" CommandArgument='<%# Eval("VisitId") %>'
                                CommandName="ViewProblems" Text="Sub-Problems" />

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
