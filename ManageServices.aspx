<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor.Master" AutoEventWireup="true" CodeBehind="ManageServices.aspx.cs" Inherits="SignalRChat.AddServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" lang="ja">
        $(document).ready(function () {
            $('#<%= ddlServices.ClientID %>').on('change', function () {
                if (this.value == 'Other')
                    //.....................^.......
                {
                    $("#Optional2").show();
                    $("#Optional1").hide();
                }
                else {
                    $("#Optional1").show();
                    $("#Optional2").hide();
                }
            });
             $('#<%= ddlDiseases.ClientID %>').on('change', function () {
                if (this.value == 'Other')
                    //.....................^.......
                {
                    $("#Optional4").show();
                    $("#Optional3").hide();
                }
                else {
                    $("#Optional3").show();
                    $("#Optional4").hide();
                }
            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Manage
                   
                        <small>Services & Diseases</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li class="active">Manage Services & Diseases</li>
                    </ol>
                </div>
            </div>
       
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header text-warning">Select Services that you Provide:</h3>
        </div>
    </div>
    <div class="form-inline">
        <div class="form-group">
            <label>Select Service:</label>
            <asp:DropDownList ID="ddlServices" runat="server" ToolTip="If Desired Service is not in the list. Select &quot;Other&quot; option and add new service."></asp:DropDownList>
        </div>
        <div id="Optional1" class="form-group">
            <asp:Button ID="ButtonSelectService" runat="server" Text="Select" CssClass="btn btn-success" OnClick="ButtonSelectService_Click" />
        </div>
    </div>
    
        <div id="Optional2" style="display:none" class="form-inline">
        <div class="form-group">
            <label>Name:</label>
            <asp:TextBox ID="TextBoxService" runat="server" Class="form-control" placeholder="Service Name"></asp:TextBox>
            <asp:Button ID="ButtonAddService" runat="server" Text="Add" CssClass="btn btn-success" OnClick="ButtonAddService_Click"/>
        </div>
    </div>
        <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header text-warning">Select Diseases that you Handle:</h3>
        </div>
    </div>
    <div class="form-inline">
        <div class="form-group">
            <label>Select Diseases:</label>
            <asp:DropDownList ID="ddlDiseases" runat="server" ToolTip="If Desired Service is not in the list. Select &quot;Other&quot; option and add new service."></asp:DropDownList>
        </div>
        <div id="Optional3" class="form-group">
            <asp:Button ID="ButtonSelectDisease" runat="server" Text="Select" CssClass="btn btn-success" OnClick="ButtonSelectDisease_Click" />
        </div>
    </div>
    
        <div id="Optional4" style="display:none" class="form-inline">
        <div class="form-group">
            <label>Name:</label>
            <asp:TextBox ID="TextBoxDisease" runat="server" Class="form-control" placeholder="Service Name"></asp:TextBox>
            <asp:Button ID="ButtonAddDisease" runat="server" Text="Add" CssClass="btn btn-success" OnClick="ButtonAddDisease_Click"/>
        </div>
    </div>
    <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
    <hr />
    <div class="row">
        <div class="col-lg-6">
    <asp:GridView ID="GridView1" runat="server" CellPadding="3" ForeColor="Black" GridLines="Vertical" ShowFooter="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CssClass="table" EmptyDataText="No Services Added">
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
        <div class="col-lg-6">
    <asp:GridView ID="GridView2" runat="server" CellPadding="3" ForeColor="Black" GridLines="Vertical" ShowFooter="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CssClass="table" EmptyDataText="No Diseases Added">
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
        </div>
</div>
</asp:Content>
