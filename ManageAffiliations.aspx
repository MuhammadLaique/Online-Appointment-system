<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor.Master" AutoEventWireup="true" CodeBehind="ManageAffiliations.aspx.cs" Inherits="SignalRChat.AddAffiliations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" lang="ja">
        $(document).ready(function () {
            $('#<%= ddlInstitute.ClientID %>').on('change', function () {
                if (this.value == 'Other')
                    //.....................^.......
                {
                    $("#Optional2").show();
                    $("#Optional1").hide();
                    $("#Optional4").show();
                }
                else {
                    $("#Optional1").show();
                    $("#Optional2").hide();
                }
            });

            $('#<%= ddlcity2.ClientID %>').on('change', function () {
                if (this.value == 'Other')
                    //.....................^.......
                {
                    $("#Optional3").show();
                    $("#Optional1").hide();
                    $("#Optional4").hide();
                }
                else {
                    $("#Optional1").show();
                    $("#Optional3").hide();
                }
            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Affiliations
                   
                        <small>With Institutes</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li class="active">Affiliations</li>
                    </ol>
                </div>
            </div>
       

    <div class="form-inline">
        <div class="form-group">
            <label>Select Institute:</label>
            <asp:DropDownList ID="ddlInstitute" runat="server" ToolTip="If Desired Institute is not in the list. Select &quot;Other&quot; option and add new Institute."></asp:DropDownList>
        </div>
         <div class="form-group">
            <label>Designation:</label>
            <asp:TextBox ID="TextBoxDesignation" runat="server" Class="form-control" placeholder="Designation" required="required"></asp:TextBox>
        </div>
    </div>
        <hr />
    <div id="Optional2" style="display:none" class="form-inline">
        
            Create New Institute record:  
        <div class="form-group">
            <label>Name:</label>
            <asp:TextBox ID="TextBoxInstitute" runat="server" Class="form-control" placeholder="Institute Name" ></asp:TextBox>
            <label>City:</label>
            <select id="ddlcity2" runat="server" tooltip="Select other"></select>
            <div id="Optional3" style="display:none" class="form-inline">
                 <hr />
            <div class="form-group">
                <label>New City Name:</label>
                <asp:TextBox ID="TextBoxCity" runat="server" Class="form-control" placeholder="City Name"></asp:TextBox>
                <asp:Button ID="ButtonAddCity" runat="server" Text="Add City" CssClass="btn btn-success" OnClick="ButtonAddCity_Click"/>               
            </div>
                <hr />
            </div>
            <label>Address:</label>
            <asp:TextBox ID="TextBoxAddress" runat="server" Class="form-control" placeholder="Institute Address" ></asp:TextBox>
            <%--<asp:TextBox ID="TextBoxCity" runat="server" Class="form-control" placeholder="Institute City" ></asp:TextBox>--%>
            <div class="form-group">
            <label for="SelectTypeList">Select Type:</label>
            <select runat="server" class="form-control" id="SelectTypeList">
                <option value="Hospital">Hospital</option>
                <option value="Personal Clinic">Personal Clinic</option>
            </select>
        </div>
            <div id="Optional4" style="display:none" >
            <asp:Button ID="ButtonAddInstitute" runat="server" Text="Add" CssClass="btn btn-success" OnClick="ButtonAddInstitute_Click"/>
            </div>
        </div>
        <hr />
    </div>
        <asp:Label ID="Label1" runat="server" CssClass="text-danger"></asp:Label>
     <div class="container">
            <div class="form-horizontal">
                <h2 class="text-warning"><b>Choose Your Schedule:</b></h2>
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
    </div>
         </div>
    <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
        <div id="Optional1" class="form-group">
            <asp:Button ID="ButtonSelect" runat="server" Text="Select" CssClass="btn btn-success" OnClick="ButtonSelect_Click" />
        </div>
    
    
        
    <hr />
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="AffiliationId" OnRowCommand="FireRowCommand" CellPadding="3" ForeColor="Black" GridLines="Vertical" ShowFooter="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CssClass="table" EmptyDataText="No Affiliations">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:LinkButton ID="btnUpdate" runat="server" CommandArgument='<%# Eval("AffiliationId") %>'
                        CommandName="Update" Text="Update" />

                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("AffiliationId") %>' CommandName="Del" Text="Delete" />
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
