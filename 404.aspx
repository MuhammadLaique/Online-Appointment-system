<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="SignalRChat._404" %>

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
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"><span>
                            <img alt="Logo" src="Images/logo.png" height="50" /></span>Punjab Patient Portal</a>
                    </div>                  
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="LandingPage.aspx">Home</a></li>
                            <li><a href="AboutUs.aspx">About Us</a></li>
                            <li><a href="Services.aspx">Our Services</a></li>
                            <li><a href="ContactUs.aspx">Contact Us</a></li>                          
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>Join Us<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="SignIn.aspx"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="DoctorSignUpRequest.aspx">Sign Up as Doctor</a></li>
                                    <li><a href="PatientSignup.aspx">Sign Up as User</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                </div>

            </nav>
        </div>
         <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">404
                    <small>Page Not Found</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a>
                    </li>
                    <li class="active">404</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <div class="row">

            <div class="col-lg-12">
                <div class="jumbotron">
                    <h1><span class="error-404">404</span>
                    </h1>
                    <p>The page you're looking for could not be found. Here is the Error:</p>
                    <br />
                    <p><%=Session["Exception"].ToString() %></p>
                    </div>
                </div>
            </div>
             </div>
        


        <footer>   
        <div class="footer-pos">           
            <p class="pull-right"><a href="#">Back to top</a>&nbsp&nbsp</p>
            <p>&nbsp&nbsp&nbsp&nbsp&copy; 2017 punjabpatientportal.com &middot; <a href="AboutUs.aspx">About Us</a> &middot; <a href="ContactUs.aspx">Contact Us</a> &middot; <a href="Services.aspx">Our Services</a></p>
        </div>
           
    </footer>
    </form>
</body>
</html>
