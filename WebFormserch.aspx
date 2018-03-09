<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormserch.aspx.cs" Inherits="SignalRChat.WebFormserch" %>

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
        $(document).ready(function () {
            $('#<%= ddlcity.ClientID %>').on('change', function () {
                if (this.value == 'Other')
                    //.....................^.......
                {
                    $("#Optional2").show();
                    $("#Optional1").hide();
                }
                else {
                    $("#Optional1").show();
                    $("#Optional2").hide();
                }
            });
        });

        $(document).ready(function () {
            $('#<%= ddlsearchfor.ClientID %>').on('change', function () {
                if (this.value == 'Hospital')
                    //.....................^.......
                {
                    $("#Div1").hide();
                }
                else {
                    $("#Div1").show();
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
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
                        <h4>Apply Search Filters:</h4>
                            <div class="form-inline" role="form">
                                <div class="form-group">
                                <label>City:</label>
                                <asp:DropDownList ID="ddlcity" runat="server" CssClass="list-unstyled" Font-Size="Large"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                <label>Search For:</label>
                                <select runat="server" class="form-control" id="ddlsearchfor">
                                <option value="Hospital">Hospital</option>
                                <option value="Doctor">Doctor</option>    
                                </select>
                                </div>
                                <div id="Div1" style="display:none">
                                    <div class="form-group">
                                <label>Search For:</label>
                                <select runat="server" class="form-control" id="Select1">
                                <option value="Doctor">Doctor</option>
                                <option value="Hospital">Hospital</option>    
                                </select>
                                </div>
                                </div>
                         </div>
                        <asp:Button ID="SearchButton" runat="server" CssClass="btn btn-success" OnClick="SearchButton_Click" Text="Find" />
                    </div>
                </div>

                 <div class="row">
                <asp:GridView ID="GridViewHospital" ShowHeader="false" GridLines="None" AutoGenerateColumns="false" runat="server">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>                                                                
                         <div class="media">
                <a class="pull-left" href="#">
                <img class="media-object" src="http://placehold.it/64x64" alt="">
                </a>
                <div class="media-body">
              <%--  <div class="row">
                    <div class="col-md-3"></div>--%>
                <div class="well">
                <h4>fdfs</h4>
                <div role="form">
                 <div class="col-md-1 text-center">
                            <p>
                                <i class="fa fa-building fa-4x"></i>
                            </p>
                            <p><label><%#Eval("Type").ToString()%></label>
                            </p>                            
                        </div>
                                            
                                            
                        <div class="col-md-5">
                            <a href="#">
                               <img class="img-responsive img-hover" src='Images/noimage.jpg' alt="">
                            </a>
                            </div>
                                            
                                            
                        <div class="col-md-6">
                            <h3>
                                <label><%#Eval("InstituteName").ToString()%></label>
                            </h3>
                            <p>
                                In<label>' '<%#Eval("City").ToString()%></label>
                            </p>
                            <p><label>' '<%#Eval("Address").ToString()%></label>
                            </p>
                            <a class="btn btn-primary" href="blog-post.html">Read More <i class="fa fa-angle-right"></i></a>
                        </div>
                 </div>
                 </div>
            </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </div>



                
 </div>
        
    </div>
    </form>
</body>
</html>
