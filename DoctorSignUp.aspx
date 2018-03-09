<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="DoctorSignUp.aspx.cs" Inherits="SignalRChat.DoctorSignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
      
        function UploadFile(input) {
            if (input.files && input.files[0] && Checkfiles()) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#<%=Image1.ClientID %>').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }
        function Checkfiles() {
            var fup = document.getElementById("<%=FileUploader.ClientID %>");
            var fileName = fup.value;
            var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
            if (ext == "gif" || ext == "GIF" || ext == "PNG" || ext == "png" || ext == "jpg" || ext == "JPG" || ext == "bmp" || ext == "BMP") {
                return true;
            }
            else {
                alert("Upload Gif,Bmp or Jpg images only");
                fup.focus();
                fup.value = null;
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">SignUp
                    <small>UserAccount</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#">SignUp Request</a>
                    </li>
                    <li class="active">SignUp</li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
        <div class="form-horizontal">
            
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-3 control-label" Text="Username" ></asp:Label>
                <div class="col-md-5">
                    <asp:TextBox ID="tbUname" runat="server" Class="form-control" placeholder="Usename" required="required"></asp:TextBox>                                   
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" CssClass="col-md-3 control-label" Text="Your Domain"></asp:Label>
                <div class="col-md-5">
                    <select runat="server" class="form-control" id="SelectDomain">
                        <option value="@punjabpatientportal.com">@punjabpatientportal.com</option>
                    </select>   
                    </div>  
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-3 control-label" Text="Password"></asp:Label>
                <div class="col-md-5">
                    <asp:TextBox ID="tbPass" runat="server" Class="form-control" placeholder="Password" TextMode="Password" required="required"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" CssClass="col-md-3 control-label" Text="Cinfirm Password"></asp:Label>
                <div class="col-md-5">
                    <asp:TextBox ID="tbCPass" runat="server" Class="form-control" placeholder="Confirm Password" TextMode="Password" required="required"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="Button2" runat="server" Class="btn btn-success" Text="Sign Up" OnClick="btSignup_Click" />
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>
            </div>
        </div>
      </div>  
            
           <div class="col-md-4">
                <asp:FileUpload ID="FileUploader" runat="server" onchange="UploadFile(this)"/>                         
            <asp:Image ID="Image1" runat="server" CssClass="img-responsive img-thumbnail" ImageUrl="~/Images/noimage.jpg" Height="250" Width="250"/>
            </div>
                
    </div>
</div>



    
</asp:Content>
