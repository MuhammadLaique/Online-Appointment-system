<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HealthForm.aspx.cs" Inherits="SignalRChat.HealthForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
                <a class="navbar-brand" href="index.html">Start Bootstrap</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="about.html">About</a>
                    </li>
                    <li>
                        <a href="services.html">Services</a>
                    </li>
                    <li>
                        <a href="contact.html">Contact</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="portfolio-1-col.html">1 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="portfolio-2-col.html">2 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="portfolio-3-col.html">3 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="portfolio-4-col.html">4 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="portfolio-item.html">Single Portfolio Item</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown active">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="blog-home-1.html">Blog Home 1</a>
                            </li>
                            <li>
                                <a href="blog-home-2.html">Blog Home 2</a>
                            </li>
                            <li class="active">
                                <a href="blog-post.html">Blog Post</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Other Pages <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="full-width.html">Full Width Page</a>
                            </li>
                            <li>
                                <a href="sidebar.html">Sidebar Page</a>
                            </li>
                            <li>
                                <a href="faq.html">FAQ</a>
                            </li>
                            <li>
                                <a href="404.html">404</a>
                            </li>
                            <li>
                                <a href="pricing.html">Pricing Table</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
<div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">HealthForum
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a>
                    </li>
                    <li class="active">HealthForum</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
             <div class="row">
                      <div class="well">
                        <h4>Ask Question:</h4>
                            <div role="form">
                                <div class="form-group">
                            <textarea id="taquestion" runat="server" class="form-control" rows="3"></textarea>
                        </div>
                        <asp:Button ID="btnsave" runat="server" Class="btn btn-success" Text="Submit" OnClick="submitquestion" />
                    </div>
                </div>
                 </div>
                
        <!-- Content Row -->
  <div class="row">
    <asp:GridView ID="GridView1" ShowHeader="false" GridLines="None" AutoGenerateColumns="false" runat="server" DataKeyNames="QuestionID" OnRowDataBound="OnRowDataBoundQ" OnRowCommand="FireRowCommand">
    <Columns>
    <asp:TemplateField>
    <ItemTemplate>              
    <div class="media">
        <a class="pull-left" href="#">
            <img class="media-object" src="http://placehold.it/64x64" alt="">
        </a>
        <div class="media-body">
            <h4 class="media-heading"><label class="text-danger"> <%#Eval("UserName")%></label>
                <small>On<label> <%#Eval("Date")%></label>at<label> <%#Eval("Time")%></label></small>
            </h4>
            <p><%#Eval("Question")%></p
           
            <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" ShowHeader="false" GridLines="None" >
                <Columns>
                <asp:TemplateField>
                <ItemTemplate>
                    <div class="media">
                    <a class="pull-left" href="#">
                    <img class="media-object" src="http://placehold.it/64x64" alt="">
                    </a>
                        <div class="media-body">
                        <h4 class="media-heading"><label class="text-warning"> <%#Eval("UserName")%></label>
                        <small>On<label> <%#Eval("Date")%></label>at<label> <%#Eval("Time")%></label></small>
                        </h4>
                        <p><%#Eval("Answer")%></p
                        </div>
                        </div>
                    <hr />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
         
            <div class="media">
                <a class="pull-left" href="#">
                <img class="media-object" src="http://placehold.it/64x64" alt="">
                </a>
                <div class="media-body">
              <%--  <div class="row">
                    <div class="col-md-3"></div>--%>
                <div class="well">
                <h4><%# Session["UserName"]%></h4>
                <div role="form">
                <div class="form-group">
               
                <asp:TextBox ID="tbanswer" runat="server" Class="form-control" ></asp:TextBox>
                </div>
                
          <asp:Button ID="btnanswer" runat="server" Class="btn btn-success" Text="Submit" CommandArgument='<%# Eval("QuestionId") %>' CommandName="answer"/>
         
                
                </div>
                 </div>
                 </div>
            </div>
                <hr/>
        </div>
    </div>
            
    
     
    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
    </asp:GridView>
</div>
</div>
<hr/>
        
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    </form>
</body>
</html>
