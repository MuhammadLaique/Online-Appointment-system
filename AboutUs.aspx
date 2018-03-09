<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="SignalRChat.AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">   
    <title>Punjab Patient Portal</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
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
                            <li><a href="AboutUs.aspx">About Us</a></li>
                            <li><a href="Services.aspx">Our Services</a></li>
                            <li><a href="ContactUs.aspx">Contact Us</a></li>                          
                        </ul>
                    </div>

                </div>

            </nav>
        </div>
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">About
                    <small>Punjab Patient Portal</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#">Home</a>
                    </li>
                    <li class="active">About Us</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Intro Content -->
        <div class="row">
            <div class="col-md-6">
                <img class="img-responsive" src="Images/Website/AboutUs/1.jpg" alt="">
            </div>
            <div class="col-md-6">
                <h2>About Punjab Patient Portal</h2>
                <p><b>Punjab Patient Portal</b> is a Final year Prject by following 2k13 Se students.</p>
                <ul class="list-unstyled">
                    <li><a href="#"><i class="fa fa-user fa-2x"></i></a><b>M.Zawwar</b></li>
                    <li><a href="#"><i class="fa fa-user fa-2x"></i></a><b>Laique Aftab</b></li>
                    <li><a href="#"><i class="fa fa-user fa-2x"></i></a><b>Ali Abid</b></li>                   
                </ul>
                <p>It is a non-Commercial and non-registered web application which provides the most authentic platform to find and consult a right doctor.</p>
                <p>It also facilitates Doctors in managing all the medical history related to their concerning Patients.</p>
            </div>
        </div>
        <!-- /.row -->

        <!-- Team Members -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Our Team</h2>
            </div>
            <div class="col-md-4 text-center">
                <div class="thumbnail">
                    <img class="img-responsive" src="Images/Website/AboutUs/2.jpg" alt="">
                    <div class="caption">
                        <h3>M.Zawwar<br/>
                            <small>Founder</small>
                        </h3>
                        <p>M.Zawwar is the key developer and the only developer of this application.He is the Requirement Engineer as well as the Designer(including architecture and Web Layouts) of this application.</p>                      
                        <ul class="list-inline">
                            <li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-4 text-center">
                <div class="thumbnail">
                    <img class="img-responsive" src="Images/Website/AboutUs/4.jpg" alt="">
                    <div class="caption">
                        <h3>Laique Aftab<br/>
                            <small>Spoiler</small>
                        </h3>
                        <p>Sir.Laique Aftab is the key member of this team which tried its best to ruin and wreck the application.</p>
                        <div class="row">&nbsp</div>
                        <div class="row">&nbsp</div>                        
                        <ul class="list-inline">
                            <li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-4 text-center">
                <div class="thumbnail">
                    <img class="img-responsive" src="Images/Website/AboutUs/3.png" alt="">
                    <div class="caption">
                        <h3>Ali Abid<br>
                            <small>Mr.India</small>
                        </h3>
                        <p>The Invisible Man which did zero effort in bringing this application in working state.</p>
                         <div class="row">&nbsp</div>
                        <div class="row">&nbsp</div>      
                        <ul class="list-inline">
                            <li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- /.row -->

        <!-- Our Customers -->
        <%--<div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Our Customers</h2>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive customer-img" src="Images/Website/AboutUs/5.jpg" alt="">
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive customer-img" src="Images/Website/AboutUs/6.jpg" alt="">
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive customer-img" src="Images/Website/AboutUs/7.jpg" alt="">
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive customer-img" src="Images/Website/AboutUs/8.jpg" alt="">
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive customer-img" src="Images/Website/AboutUs/9.jpg" alt="">
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive customer-img" src="Images/Website/AboutUs/10.jpg" alt="">
            </div>
        </div>--%>
        <!-- /.row -->

        <hr>
        <footer>
       <div class="container">
        <div class="footer-pos">
             <hr />
            <p class="pull-right"><a href="#">Back to top</a></p>
            <p>&nbsp&nbsp&nbsp&nbsp&copy; 2017 punjabpatientportal.com &middot; <a href="Home.aspx">Home</a> &middot; <a href="#">About Us</a> &middot; <a href="Contact.aspx">Contact Us</a> &middot; <a href="Home.aspx">Services</a></p>
        </div>
           </div>
    </footer>
        </div>
        
    </form>
</body>
</html>
