<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor.Master" AutoEventWireup="true" CodeBehind="ManageAppointmentRequests.aspx.cs" Inherits="SignalRChat.ViewPatientAppointmentRequests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Appointment                  
                        <small>Requests</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li class="active">Appointment Requests</li>
                    </ol>
                </div>
            </div>
       
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="AppointmentID" OnRowCommand="FireRowCommand" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CssClass="table" EmptyDataText="No Requests" ShowFooter="True">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:LinkButton ID="btnRespond" runat="server" CommandArgument='<%# Eval("AppointmentId") %>'
                        CommandName="Respond" Text="Respond" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:LinkButton ID="btnChat" runat="server" CommandArgument='<%# Eval("AppointmentId") %>'
                        CommandName="Chat" Text="Chat" />

                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:LinkButton ID="btnAdd" runat="server" CommandArgument='<%# Eval("AppointmentId") %>'
                        CommandName="Add" Text="Add To Patients List" />

                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("AppointmentId") %>' CommandName="Del" Text="Delete" />
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
