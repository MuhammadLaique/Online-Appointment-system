<%@ Page Title="" Language="C#" MasterPageFile="~/CommonMaster.Master" AutoEventWireup="true" CodeBehind="MailPage.aspx.cs" Inherits="SignalRChat.MailPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript" lang="ja">
        $(document).ready(function () {
            $('#<%= ddlusername.ClientID %>').on('change', function () {
                
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Mail                   
                        <small>Engine</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li class="active">Mail Engine</li>
                    </ol>
                </div>
            </div>
       

    <div class="form-horizontal">
        <div class="form-group">
            <div class="col-md-1"></div>
            <div class="col-md-2">
                <label>Send To:</label>
                <asp:TextBox ID="Recipient" CssClass="form-control" runat="server" required="required" ToolTip="Dont remember Username. Select it from the list."></asp:TextBox>
                <div class="form-group">
                <label>Or Select Username:</label>
                <asp:DropDownList ID="ddlusername" runat="server" OnSelectedIndexChanged="ddlusername_SelectedIndexChanged"></asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-1"></div>
            <div class="col-md-6">
                <label for="comment">Message:</label>
                <textarea class="form-control" rows="5" id="message" runat="server"></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-2"></div>
            <div class="col-md-6">
                <asp:Button ID="Button1" runat="server" Text="Send" CssClass="btn btn-success" OnClick="Button1_Click" />
                <asp:Label ID="lblMsg" runat="server" CssClass="text-danger"></asp:Label>
            </div>
        </div>

    </div>
    <hr />
    <%--<div class="col-lg-4 col-lg-offset-2">
    <--%>
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header text-danger">Your Mails:</h3>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-1"></div>
        <div class="col-md-6">
            <asp:GridView ID="GridView1" runat="server" CssClass="table" DataKeyNames="MessageId" OnRowCommand="FireRowCommand" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" EmptyDataText="No Message" ShowFooter="True">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("MessageId") %>'
                                CommandName="Del" Text="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btnReply" runat="server" CommandArgument='<%# Eval("MessageId") %>'
                                CommandName="Reply" Text="Reply" />

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btnForward" runat="server" CommandArgument='<%# Eval("MessageId") %>'
                                CommandName="Forward" Text="Forward" />

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
    <div class="form-inline">
        <div class="col-md-2"></div>
        <div class="col-md-6">
            <asp:Button ID="Button3" runat="server" Text="InBox" CssClass="btn btn-success" OnClick="InBoxToggleButton_Click" />
        </div>
        <div class="col-md-2"></div>
        <div class="col-md-6">
            <asp:Button ID="Button2" runat="server" Text="SentBox" CssClass="btn btn-primary" OnClick="SentBoxToggleButton_Click" />
        </div>
    </div>
</div>
</asp:Content>
