<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorDetails.aspx.cs" Inherits="SignalRChat.DoctorDetails1" %>

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
    <script>
      function initMap() {
        var uluru = {lat: -25.363, lng: 131.044};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 16,
          center: uluru
        });       
        var geocoder = new google.maps.Geocoder();
        geocodeAddress(geocoder, map);
      }
      function geocodeAddress(geocoder, resultsMap) {
          var address ="<%=address.ToString()%>"; // here is the addreess input.....          
          geocoder.geocode({ 'address': address }, function (results, status) {
              if (status === 'OK') {
                  resultsMap.setCenter(results[0].geometry.location);
                  var marker = new google.maps.Marker({
                      map: resultsMap,
                      position: results[0].geometry.location
                  });
              } else {
                  alert('Geocode was not successful for the following reason: ' + status);
              }
          });
      }
    </script>
     <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyANbX1n_VecQvvM44UJWG39d7svoApIWy4&callback=initMap">
    </script>
    <<style>
       #map {
        height: 400px;
        width: 100%;
       }
    </style> 
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
                    <h1 class="page-header">Doctor
                   
                        <small>Details</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li><a href="#">Search Doctor</a>
                        </li>
                        <li class="active">Doctor Details</li>
                    </ol>
                </div>
            </div>
    <div class="row">        
            <div class="col-md-8">
                 <a href="#">
                    <img class="img-responsive img-hover img-circle" src='Images/noimage.jpg' height="1"/>
                    </a>
             </div>          
                <div class="col-md-4">
                    
                <h3><%=name%></h3>
                <p>
                    <%=Session["address"]%>
                </p>
                <p><i class="fa fa-phone"></i> 
                    <abbr title="Phone">P</abbr>: 032228000316</p>
                <p><i class="fa fa-envelope-o"></i> 
                    <abbr title="Email">E</abbr>: <a href="mailto:zawwarkhan316@gmail.com">zawwarkhan316@gmail.com</a>
                </p>
                <p><i class="fa fa-clock-o"></i> 
                    <abbr title="Hours">H</abbr>: Monday - Friday: 9:00 AM to 5:00 PM</p>
                <ul class="list-unstyled list-inline list-social-icons">
                    <li><a href="#"><i class="fa fa-facebook-square fa-2x"></i></a> </li>
                    <li><a href="#"><i class="fa fa-linkedin-square fa-2x"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter-square fa-2x"></i></a></li>
                    <li> <a href="#"><i class="fa fa-google-plus-square fa-2x"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
