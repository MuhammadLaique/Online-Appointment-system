<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="SignalRChat.ContactUs"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>  
    <title>Punjab Patient Portal</title>   
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/modern-business.css" rel="stylesheet"/>
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
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
          var address = "university of gujrat sialkot campus,sialkot,pakistan"; // here is the addreess input.....
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
<body><form id="form1" runat="server">
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
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Contact
                    <small>Us</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a>
                    </li>
                    <li class="active">Contact Us</li>
                </ol>
            </div>
        </div>

        <div class="row">        
            <div class="col-md-8">
                 <div id="map"></div>    
             </div>   
                <div class="col-md-4">
                <h3>Contact Details</h3>
                <p>
                    University Of Gujrat Sialkot Campus<br>Daska Road, Sialkot<br>
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
        <div class="row">
            <div class="col-md-8">
                <h3>Send us a Message</h3>
                <div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Full Name:</label>
                            <input type="text" class="form-control" id="name" required="required" runat="server"/>
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Phone Number:</label>
                            <input type="tel" class="form-control" id="phone" required="required" runat="server"/>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Email Address:</label>
                            <input type="email" class="form-control" id="email" required="required" runat="server"/>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Message:</label>
                            <textarea rows="10" cols="100" class="form-control" id="message" required="required" maxlength="999" style="resize:none" runat="server"></textarea>
                        </div>
                    </div>
                    <div id="success"></div>
                    <%--<button type="submit" class="btn btn-primary">Send Message</button>--%>
                    <asp:Button ID="btnSend" runat="server" Text="Send Message" CssClass="btn btn-warning" OnClick="btnSend_Click"/>
                </div>
            </div>
            
        </div>
    </div>
        <footer>
      
        <div class="footer-pos">
             <hr />
            <p class="pull-right"><a href="#">Back to top</a></p>
            <p>&nbsp&nbsp&nbsp&nbsp&copy; 2017 punjabpatientportal.com &middot; <a href="Home.aspx">Home</a> &middot; <a href="#">About Us</a> &middot; <a href="Contact.aspx">Contact Us</a> &middot; <a href="Home.aspx">Services</a></p>
        </div>
           
    </footer>
    </form>
</body>
</html>
