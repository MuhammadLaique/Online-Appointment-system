<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="SignalRChat.SignIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
               
        function TriggerModal()
        {
            $("#<%=modaltrigger.ClientID %>").click();
        }

        
        function LogoutButtonClick() {

          $("#<%=Button1.ClientID %>").click();
            document.getElementById("ii").innerHTML = "asasasasa";
}
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <!--- Sign in start  -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">SignIn                 
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li class="active">SignIn</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->            
            <!-- Blog Post Row -->

            <div class="row">
            <div class="form-horizontal">               
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Username" ></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="UserName" CssClass="form-control" runat="server" required="required"></asp:TextBox>
                        
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Password"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="Password" CssClass="form-control" runat="server" TextMode="Password" required="required"></asp:TextBox>
                        
                    </div>
                </div>
                <div class="form-group">
                        <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                        <asp:Label ID="Label3" runat="server" CssClass="control-label" Text="Remember me ?"></asp:Label>
                    </div>
                </div>
                 <div class="form-group">
                        <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <button id="modaltrigger" runat="server" type="button" class="btn navbar-btn btn-primary" data-toggle="modal" data-target="#InformationModal">
                        <span class="glyphicon glyphicon-log-out"></span>SignOut
                        </button>                        
                        <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-warning" OnClick="Button1_Click" />
                        
                    </div>
                </div>
                <div class="form-group">
                        <div class="col-md-2"></div>                    
                        <div class="col-md-6">
                            <asp:LinkButton ID="lbForgotPass" runat="server" CssClass="text-danger" PostBackUrl="~/ForgotPassword.aspx">Forgot Password !</asp:LinkButton>
                        
                        </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/PatientSignUp.aspx">Sign Up</asp:LinkButton>
                        <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
                        </div>
                </div>
            </div>
            </div>
        </div>
        <!--- Sign in end  -->
    <div id="InformationModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <h4 class="modal-title text-center">Cinfirm</h4>
    </div>
    <div id="ModalText" class="modal-body">       
    </div>
    <div class="modal-footer">          
    <button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
    </div>     
    </div>
    </div>
    </div>

</asp:Content>
