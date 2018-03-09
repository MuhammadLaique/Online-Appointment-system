<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor.Master" AutoEventWireup="true" CodeBehind="ManagePrescriptions.aspx.cs" Inherits="SignalRChat.ManagePrescriptions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Manage Patient
                   
                        <small>Prescriptions</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li><a href="#">Manage Visits</a>
                        </li>
                        <li class="active">Manage Prescriptions</li>
                    </ol>
                </div>
            </div>
      

    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header text-danger">Add new Prescription for this Particular Visit:</h3>
        </div>
    </div>
    <div class="form-inline">
        <div class="form-group">
            <label>Medication:</label>
            <textarea class="form-control" rows="5" id="taMedication" runat="server"></textarea>
        </div>
        <div class="form-group">
            <label>Dosage:</label>
            <asp:TextBox ID="tbDosage" runat="server" Class="form-control" placeholder="Dosage" TextMode="Number"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Frequency:</label>
            <asp:TextBox ID="tbFrequency" runat="server" Class="form-control" placeholder="Frequency" TextMode="Number"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="ButtonAdd" runat="server" Text="Add" CssClass="btn btn-success" OnClick="ButtonAdd_Click"/>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header text-danger">Prescriptions for this Patient:</h3>
        </div>
    </div>
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="PrescriptionID" OnRowCommand="FireRowCommand" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CssClass="table" EmptyDataText="No Prescriptions" ShowFooter="True">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>                    
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:LinkButton ID="btnDeactive" runat="server" CommandArgument='<%# Eval("PrescriptionId") %>' CommandName="Deactivate" Text="Deactivate" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("PrescriptionId") %>' CommandName="Del" Text="Remove" />
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
