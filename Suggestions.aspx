<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Suggestions.aspx.cs" Inherits="SignalRChat.Suggestions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Punjab Patient Portal</title>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/modern-business.css" rel="stylesheet" />
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />  
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.html"><span>
                            <img alt="Logo" src="Images/logo.png" height="50" /></span>Punjab Patient Portal</a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Home.aspx">Home</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="Contact.aspx">Contact Us</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Our Services<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="Search.aspx">Find Doctor</a></li>
                                    <li><a href="Search.aspx">Find Hospital</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="ChatPage.aspx">Chat Room</a></li>
                                    <li><a href="#">Mail Room</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">Health Blogs</a></li>
                                    <li><a href="#">Ask Online Questions</a></li>
                                    <li><a href="#">All Users</a></li>
                                </ul>
                            </li>
                            <li><a href="SignIn.aspx"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>SignUp<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="DoctorSignUpRequest.aspx">Sign Up for Doctor Account</a></li>
                                    <li><a href="#">Sign Up for User Account</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                </div>

            </nav>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Suggest An
                   
                        <small>Edit</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li><a href="#">Search Doctor</a>
                        </li>
                            <li><a href="#">Doctor Details</a>
                        </li>
                        <li class="active">Suggest An Edit</li>
                    </ol>
                </div>
            </div>
            <div class="text-center"><h3>Report Incorrect Information</h3></div>
            <div class="row">
            <div class="col-md-8">
                <div class="form-horizontal">         
                    <div class="form-group">                             
                    <div class="col-md-5">
                    <label>Your Contact#</label>
                    <asp:TextBox ID="tbPhone" runat="server" Class="form-control" placeholder="Usename" required="required"></asp:TextBox>                                   
                    </div>
                    </div>
                    <br />
                    <label>Please Mark Which information is Incorrect!</label>
                    <div class="form-group">                             
                    
                     <div class="col-md-1"></div>
                    <label class="checkbox-inline"><input type="checkbox" id="time" runat="server"/><b>Timing</b></label>
                    <label class="checkbox-inline"><input type="checkbox" id="Fee" runat="server"/><b>Fee</b></label>
                    <label class="checkbox-inline"><input type="checkbox" id="Education" runat="server"/><b>Education</b></label>
                    <label class="checkbox-inline"><input type="checkbox" id="Experience" runat="server"/><b>Experience</b></label>
                    <label class="checkbox-inline"><input type="checkbox" id="Address" runat="server"/><b>Address</b></label>
                    <label class="checkbox-inline"><input type="checkbox" id="ContactInfo" runat="server"/><b>ContactInfo</b></label>
                   
                    </div>
                    <br />
                    <div class="form-group">          
                    <div class="col-md-9">
                    <label>Your Comments:</label>
                    <textarea class="form-control" rows="5" id="tamessage" runat="server"></textarea>
                    </div>
                    </div>
                    <div class="form-group">            
                    <div class="col-md-6">
                    <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" CssClass="btn btn-warning" OnClick="ButtonSubmit_Click" />
                    <asp:Label ID="lblMsg" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                    </div>
                </div>
                
            </div>


        </div>
    </form>
</body>
</html>
