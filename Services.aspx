<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="SignalRChat.Services" %>

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
    <div class="container">
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
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Services
                    <small>What we Offer!</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#">Home</a>
                    </li>
                    <li class="active">Services</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Image Header -->
        <div class="row">
            <div class="col-lg-12">
                <img class="img-responsive" src="Images/Website/Services/1.png" alt="">
            </div>
        </div>
        <!-- /.row -->

        <!-- Service Panels -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">What we Offer to Patients</h2>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-user-md fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4><b>Find Nearest Doctor</b></h4>
                        <p>Find your nearest authentic doctor. All information you need to know is available. You can also compare doctors with respect to fee, timing and qualification.</p>
                        <a href="SearchDoctor.aspx" class="btn btn-warning">Find Doctor</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-hospital-o fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4><b>Find Nearest Hospital</b></h4>
                        <p>Find your nearest authentic Hospital. You can also check which doctors are <u>Onboard </u>in a particular hspital.</p>
                        <br />
                        <br />
                        <a href="SearchDoctor.aspx" class="btn btn-warning">Find Hospital</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-question fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4><b>Health Forum</b></h4>
                        <p>Write down your symptoms and enter your history to get doctor advice.you may recieve response from multiple doctors. Choose what suits you best!</p>
                        <a href="HealthForm.aspx" class="btn btn-warning">Post Question</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-comments fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4><b>Health Blog</b></h4>
                        <p>Are you a Health Practitioner. Read Blogs written By our highly qualified Doctors.</p>
                        <br />
                        <br />
                        <a href="BlogPage.aspx" class="btn btn-warning">Read Blogs</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Service Tabs -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">What we Offer to Doctors</h2>
            </div>
            <div class="col-lg-12">

                <ul id="myTab" class="nav nav-tabs nav-justified">
                    <li class="active"><a href="#service-one" data-toggle="tab"><i class="fa fa-users"></i> Build profile</a>
                    </li>
                    <li class=""><a href="#service-two" data-toggle="tab"><i class="fa fa-calendar-o"></i> Online Appointment Booking</a>
                    </li>
                    <li class=""><a href="#service-three" data-toggle="tab"><i class="fa fa-mail-forward"></i> Communicate</a>
                    </li>
                    <li class=""><a href="#service-four" data-toggle="tab"><i class="fa fa-comments"></i> Get Reviews</a>
                    </li>
                </ul>

                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade active in" id="service-one">
                        <h4><b>Build Profile</b></h4>
                        <p>Join the Network of Doctors & Physicians across Punjab and Connect to find patients. Build your Medical Profile Online. It just take 5 minutes to build it.</p>
                        <p>IF YOU DON'T ADOPT TECHNOLOGY,You will soon be unknown!</p>
                    </div>
                    <div class="tab-pane fade" id="service-two">
                        <h4><b>Online Appointment Booking</b></h4>
                        <p>Your Profile will be shown to aptients. They can book appointment online and the notifications will be sent to you online.</p>
                        <p>Always stay informed about your clinic status.</p>                  
                    </div>
                    <div class="tab-pane fade" id="service-three">
                        <h4><b>Communicate</b></h4>
                        <p>Use our Mail services to get communicate with multiple patients at one time!</p>
                        <p>You can also help instantly your patients and in the case of EMERGENCY and build your trust.</p>
                    </div>
                    <div class="tab-pane fade" id="service-four">
                        <h4><b>Get Reviews</b></h4>
                        <p>Get & Publish positive reviews to earn patients.</p>
                        <p>Help patients online and list as top doctor in your field.</p>
                    </div>
                </div>

            </div>
        </div>

        <!-- Service List -->
        <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">All Services</h2>
            </div>
            <div class="col-md-4">
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-user-md fa-stack-1x fa-inverse"></i>
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><b>Find Doctor</b></h4>
                        <p>Patients can find nearest authentic doctor.Compare doctors with respect to fee, timing and qualification.</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-hospital-o fa-stack-1x fa-inverse"></i>
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><b>Find Hospital</b></h4>
                        <p>Patients can find nearest authentic Hospital. Check which doctors are Onboard in a particular hspital.</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-question fa-stack-1x fa-inverse"></i>
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><b>Health Forum</b></h4>
                        <p>Patients can Write down symptoms and enter history to get advice from multiple doctors.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-comments fa-stack-1x fa-inverse"></i>
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><b>Health Blog</b></h4>
                        <p>Patients can Read Blogs written By our highly qualified Doctors.</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-user-md fa-stack-1x fa-inverse"></i>
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><b>Build Profile</b></h4>
                        <p>Doctors can Build their Medical Profile Online. It just take 5 minutes to build it.</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-calendar fa-stack-1x fa-inverse"></i>
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><b>Online Apppointment</b></h4>
                        <p>Patients after selection can book appointment online and the notifications will be sent to doctors online.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-mail-forward fa-stack-1x fa-inverse"></i>
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><b>Mail services</b></h4>
                        <p>Patients and Doctors can use our Mail services to get communicate with each other!</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                                  <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-mail-reply fa-stack-1x fa-inverse"></i>
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><b>Instant Messaging</b></h4>
                        <p>Patients and Doctors can use our Instant Messaging Service to communicate instantly and privately in the case of EMERGENCY.</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-mail-reply-all fa-stack-1x fa-inverse"></i>
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><b>Reviews</b></h4>
                        <p>Patients can review doctors and suggest edit and help Punkjab Patient Portal to maintain list of doctors and eliminate scam.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
    </form>
</body>
</html>
