<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageDoctorRegistrationRequests.aspx.cs" Inherits="SignalRChat.ViewDoctorRegistrationRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Registration Requests
                   
                        <small>Doctor</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li class="active">Registration Requests</li>
                    </ol>
                </div>
            </div>
        <div class="row">
                <div class="col-lg-12">
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="RequestID,Email" OnRowCommand="FireRowCommand" EmptyDataText="No Requests" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="table" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField HeaderText="RESPOND">
                <ItemTemplate>
                    <asp:LinkButton ID="btnRespond" runat="server" CommandArguMent='<%# Eval("RequestId") %>'
                        CommandName="Respond" Text="Respond" />
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
    </div>
</asp:Content>
