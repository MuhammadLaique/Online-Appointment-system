<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlogDetails.aspx.cs" Inherits="SignalRChat.BlogDetails" %>

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

     <!-- Navigation -->
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
                                <li class="active">
                                    <a href="blog-home-2.html">Blog Home 2</a>
                                </li>
                                <li>
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

        <!-- Page Content -->
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Blog
                   
                        <small>Details</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li><a href="#">Explore Blogs</a>
                        </li>
                        <li class="active">Blog Details</li>
                    </ol>
                </div>
            </div>

             <div class="row">        
            <div class="col-md-8">
                 <a href="#">
                    <img class="img-responsive img-hover img-circle" src='Images/Blogs/<%=blogid%>.jpg' height="1"/>
                    </a>
             </div>          
                <div class="col-md-4">
                    <h3>By</h3>
                <h3 class="text-danger">Dr.<%=name%>                    
                </h3>
                <p>
                    
                </p>
                    <p><i class="fa fa-clock-o"></i> 
                    <abbr title="Specialization">Specialization</abbr>:<%=specialization%>  </p>
                <p><i class="fa fa-phone"></i> 
                    <abbr title="Phone">Phone</abbr>:<%=phone%></p>                
                <p><i class="fa fa-envelope-o"></i> 
                    <abbr title="Email">Email</abbr>:<%=email%> <a> href="mailto:<%=email%>"</a></p>                   
                <p><i class="fa fa-clock-o"></i> 
                    <abbr title="Created On">Created On</abbr>:<%=date%></p>
                    <p><i class="fa fa-clock-o"></i> 
                    <abbr title="At">At</abbr>:<%=time%></p>                                     
                <ul class="list-unstyled list-inline list-social-icons">
                    <li><a href="#"><i class="fa fa-facebook-square fa-2x"></i></a> </li>
                    <li><a href="#"><i class="fa fa-linkedin-square fa-2x"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter-square fa-2x"></i></a></li>
                    <li> <a href="#"><i class="fa fa-google-plus-square fa-2x"></i></a></li>
                </ul>
                    <br />
                    <p><label>Topic:&nbsp<%=topic%></label></p>
                    
                    <p><label>category:&nbsp<%=category%></label></p>
                    
                    <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=(message.Length>400)?message.Substring(0,400):message%></p>
                   
            </div>
        </div>
            <hr />
            <div class="row">              
                <p><%=(message.Length>400)?message.Substring(401,message.Length-401):null%></p>
            </div>
         
            <div class="row">
            <div class="col-lg-12">
            <h3 class="page-header"><b>Other Blogs By the Writer:</b></h3>
            </div>
            </div>
               
            <div class="row">
                <asp:GridView ID="GridViewDoctorOtherBlogs" ShowHeader="false"
                    GridLines="None" AutoGenerateColumns="false"
                    runat="server" OnRowCommand="FireRowCommandDoctorOtherBlogs" DataKeyNames="BlogId">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <div class="well">
                                   
                                        <div class="row">
                                        
                                           
                                                <div class="col-md-1 text-center">
                                                    <p>
                                                        <i class="fa fa-camera fa-4x"></i>
                                                    </p>
                                                    <p>On<asp:Label ID="Label1" CssClass="text-warning" runat="server" Text='<%#Eval("Date")%>'> 
                                                 </asp:Label></p>
                                                    <p>At<asp:Label ID="Label2" CssClass="text-warning" runat="server" Text='<%#Eval("Time").ToString()%>'> 
                                                 </asp:Label></p>
                                                </div>
                                            
                                            
                                                <div class="col-md-5">
                                                    <a href="blog-post.html">
                                                        <img class="img-responsive img-hover" src='<%#"/Images/Blogs/"+Eval("BlogId")+".jpg"%>' alt="">
                                                    </a>
                                                   </div>
                                            
                                            
                                                <div class="col-md-6">
                                                    <h3>
                                                        <a href="blog-post.html"> <asp:Label ID="Label5" CssClass="text-warning" runat="server" Text='<%#Eval("Topic").ToString()%>'> 
                                                    </asp:Label></a>
                                                    </h3>
                                                    <p>
                                                        by <a href="#"> <asp:Label ID="Label6" CssClass="text-warning" runat="server" Text='<%#Eval("Name").ToString()%>'> 
                                                    </asp:Label></a>
                                                    </p>
                                                    <p><asp:Label ID="Label7" runat="server" Text='<%#(Eval("Message").ToString().Length>300)?Eval("Message").ToString().Substring(0,300)+"....":Eval("Message").ToString()%>'> 
                                                    </asp:Label></p>
                                                    <%--<a class="btn btn-primary" href="blog-post.html">Read More <i class="fa fa-angle-right"></i></a>--%>
                                                    <asp:LinkButton ID="btn65757" runat="server" Class="btn btn-success" Text="ViewBlog" CommandArgument='<%# Eval("BlogId") %>' CommandName="ViewDetails"/>
                                                </div>
                                            
                                            </div>
                                        
                                    </div>
                                        <hr />
                                   
                                

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </div>
            
            <div class="row">
            <div class="col-lg-12">
            <h3 class="page-header"><b>Blogs with Same Category:</b></h3>
            </div>
            </div>
               
            <div class="row">
                <asp:GridView ID="GridViewSimilarBlogs" ShowHeader="false"
                    GridLines="None" AutoGenerateColumns="false"
                    runat="server" OnRowCommand="FireRowCommandSimilarBlogs" DataKeyNames="BlogId">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <div class="well">
                                   
                                        <div class="row">
                                        
                                           
                                                <div class="col-md-1 text-center">
                                                    <p>
                                                        <i class="fa fa-camera fa-4x"></i>
                                                    </p>
                                                    <p>On<asp:Label ID="Label1" CssClass="text-warning" runat="server" Text='<%#Eval("Date")%>'> 
                                                 </asp:Label></p>
                                                    <p>At<asp:Label ID="Label2" CssClass="text-warning" runat="server" Text='<%#Eval("Time").ToString()%>'> 
                                                 </asp:Label></p>
                                                </div>
                                            
                                            
                                                <div class="col-md-5">
                                                    <a href="blog-post.html">
                                                        <img class="img-responsive img-hover" src='<%#"/Images/Blogs/"+Eval("BlogId")+".jpg"%>' alt="">
                                                    </a>
                                                   </div>
                                            
                                            
                                                <div class="col-md-6">
                                                    <h3>
                                                        <a href="blog-post.html"> <asp:Label ID="Label5" CssClass="text-warning" runat="server" Text='<%#Eval("Topic").ToString()%>'> 
                                                    </asp:Label></a>
                                                    </h3>
                                                    <p>
                                                        by <a href="#"> <asp:Label ID="Label6" CssClass="text-warning" runat="server" Text='<%#Eval("Name").ToString()%>'> 
                                                    </asp:Label></a>
                                                    </p>
                                                    <p><asp:Label ID="Label7" runat="server" Text='<%#(Eval("Message").ToString().Length>300)?Eval("Message").ToString().Substring(0,300)+"....":Eval("Message").ToString()%>'> 
                                                    </asp:Label></p>
                                                    <%--<a class="btn btn-primary" href="blog-post.html">Read More <i class="fa fa-angle-right"></i></a>--%>
                                                    <asp:LinkButton ID="btn1234" runat="server" Class="btn btn-success" Text="ViewBlog" CommandArgument='<%# Eval("BlogId") %>' CommandName="ViewDetails"/>
                                                </div>
                                            
                                            </div>
                                        
                                    </div>
                                        <hr />
                                   
                                

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </div>




    </div>
        <footer>
       
        <div class="footer-pos">
             <hr />
            <p class="pull-right"><a href="#">Back to top</a></p>
            <p>&nbsp&nbsp&nbsp&nbsp&copy; 2017 punjabpatientportal.com &middot; <a href="AboutUs.aspx">About Us</a> &middot; <a href="ContactUs.aspx">Contact Us</a> &middot; <a href="Services.aspx">Our Services</a></p>
        </div>
          
    </footer>
    </form>
</body>
</html>
