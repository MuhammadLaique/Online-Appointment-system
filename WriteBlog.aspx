<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WriteBlog.aspx.cs" Inherits="SignalRChat.WriteBlog" %>

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
</head>
<body>
    <form id="form1" runat="server">
    <div>
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
                    <h1 class="page-header">Create New Blog 
                   
                        <small>Post</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a>
                        </li>
                        <li class="active">Blog Home Two</li>
                    </ol>
                </div>
            </div>
            
           


            </div>
    <!-- Comments Form -->
                <div class="well">                     
                    <div role="form">
                        <div class="form-group">
                            <label>Topic:</label>
                            <asp:TextBox ID="tbtopic" CssClass="form-control" runat="server"  placeholder="Topic"></asp:TextBox>                  
                        </div>
                        <div class="form-group">
                            <label>Tag:</label>
                            <asp:TextBox ID="tbcategory" CssClass="form-control" runat="server"  placeholder="Category"></asp:TextBox>                  
                        </div>             
                        <div class="form-group">
                            <label>Content:</label>
                            <textarea id="tacontent" class="form-control" rows="12" runat="server"  placeholder="Content"></textarea>
                        </div>
                        <div class="form-group">
                            <asp:FileUpload ID="FileUploader" runat="server" onchange="UploadFile(this)" />
                           
                            <asp:Image ID="Image1" runat="server" CssClass="img-responsive img-thumbnail" ImageUrl="~/Images/noimage.jpg" Height="250" Width="250"/>
                        </div>
                        <div class="form-group">
                        <asp:Button ID="btnsave" runat="server" Class="btn btn-success" Text="Save" OnClick="btnSave_Click" />
                        <asp:Label ID="lblMsg" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>

                <hr />

                <!-- Posted Comments -->
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
