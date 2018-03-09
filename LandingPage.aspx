<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="SignalRChat.LandingPage" %>

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



        <div id="carousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <%--<ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    </ol>--%>
                    <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                            <img src="Images/Website/landingpage/slider/sl1.jpg"/>
                            <%--<div class="carousel-caption">
                                <h3>HELLO!! WE ARE Punjab PATIENT PORTAL</h3>
                                <p><a class="btn btn-lg btn-primary" href="DoctorSignupRequestPage.aspx" role="button">Join Us Today</a></p>
                            </div>--%>
                        </div>
                        <div class="item">
                            <img src="Images/Website/landingpage/slider/sl3.jpg"/>
                           <%-- <div class="carousel-caption pull-left">
                                <h3>WE BELIVE IN TREATMENT THROUGH TECHNOLOGY AND PROPER CARE</h3>
                            </div>--%>
                        </div>
                        <div class="item">
                            <img src="Images/Website/landingpage/slider/sl2.jpg"/>
                            <%--<div class="carousel-caption">
                                <h3>Connect To Punjab Patient Portal</h3>

                            </div>--%>
                        </div>
                        <div class="item">
                            <img src="Images/Website/landingpage/slider/sl3.jpg"/>
                            <%--<div class="carousel-caption">
                                <h3>AND CHECK OUR HIGHLY QUALIFIED DOCTORS</h3>
                            </div>--%>
                            </div>
                        
                    </div>
                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

   <div class="container">

        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Welcome to Punjab Patient Portal
                </h1>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><b>Doctors</b></h4>
                    </div>
                    <div class="panel-body">
                        <p><b>Doctors</b> can Join us by filling a form and sending us a request. </p>
                        <p>Our team will contact you and after cinfirmation and satisfaction may provide you with an Account. Docters will then update their Profile and Schedule.</p>
                        <a href="Services.aspx" class="btn btn-warning">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-gift"></i><b>Non-Registered Users</b></h4>
                    </div>
                    <div class="panel-body">
                        <p><b>Non-Registered Users </b>can Search for Doctors and can select from our list of Doctors according.</p>               
                        <p>They can Use Phone no. provided by the Doctor toi Get Appointment.</p>
                        <div class="row">&nbsp</div>
                        <a href="Services.aspx" class="btn btn-warning">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-compass"></i><b>Registered Patients</b></h4>
                    </div>
                    <div class="panel-body">
                        <p><b>Registered Users </b>can search for doctor as well as get appointment through our online appointment system.</p>
                        <p>They can also use our Mail service and Instant Messaging service to communicate with Doctors.</p>
                        
                        <a href="Services.aspx" class="btn btn-warning">Learn More</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->

        <!-- Portfolio Section -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">What We Offer To PATIENTS!</h2>
            </div>
        </div>
       <div class="row">
            <div class="col-md-7">
                <a href="SearchDoctor.aspx">
                    <img class="img-responsive img-hover" src="Images/Website/landingpage/1.png" alt="">
                </a>
            </div>
            <div class="col-md-5">
                <div class="row">&nbsp</div>
                <div class="row">&nbsp</div>
                <div class="row">&nbsp</div>
                <div class="row">&nbsp</div>
                <div class="row">&nbsp</div>
                <h3 class="text-danger">Find Nearest Doctor</h3>                
                <p class="text-capitalize">Find your nearest authentic doctor. All information you need to know is available. You can also compare doctors with respect to:</p>
                <ul>
                    <li><strong>1.Location</strong></li>
                    <li><strong>2.Specialization</strong></li>
                    <li><strong>3.Gender</strong></li>
                    <li><strong>4.Fee</strong></li>
                    <li><strong>5.Medical services</strong></li>
                    <li><strong>6.Qualification</strong></li>
                    <li><strong>7.Recommendations</strong></li>
                    <li><strong>8.Schedule</strong></li>
                </ul>
                <a class="btn btn-lg btn-warning" href="SearchDoctor.aspx">Find</a>
            </div>
        </div>
        <!-- /.row -->
        <hr>
        <!-- /.row -->
         <div class="row">
            <div class="col-md-7">                            
                <h3 class="text-danger">Book Appointment Online</h3>                
                <ul>
                    <li><strong>1.SELECT DOCTOR</strong>
                    </li>
                    <p>Choose the doctor who suits your need based by looking at his location, fee, reviews and schedule</p>
                    <li><strong>2.BOOK APPOINTMENT</strong>
                    </li>
                    <p>Easeist method to book appointment in one click. Just choose hospital/clinic, time and patient.</p>
                    <p>You can call to the the phone no. given by the doctor.</p>
                    <p class="text-success">You can also use our online appointment system to send request to the doctor.</p>
                    <li><strong>3.GET REMINDER</strong>
                    </li>
                    <p>Our online appointment system launches Reminders that will help you to show up for appointment at right time.</p>
                </ul>
                <a class="btn btn-warning" href="SearchDoctor.aspx">Get Appointment</a>
            </div>
             <div class="col-md-5">
                <a href="SearchDoctor.aspx">
                    <img class="img-responsive img-hover" src="Images/Website/landingpage/2.png" alt="">
                </a>
            </div>
        </div>
        <!-- /.row -->
        <hr>
       <div class="row">&nbsp</div>
       <div class="row">
            <div class="col-md-7">
                <a href="SearchDoctor.aspx">
                    <img class="img-responsive img-hover" src="Images/Website/landingpage/3.png" alt="">
                </a>
            </div>
            <div class="col-md-5">
                <div class="row">&nbsp</div>
                <div class="row">&nbsp</div>
                <div class="row">&nbsp</div>
                <div class="row">&nbsp</div>
                <div class="row">&nbsp</div>
                <div class="row">&nbsp</div>
                <div class="row">&nbsp</div>
                <h3 class="text-danger">Give feedback to your doctor!</h3> 
                <div class="row">&nbsp</div>               
                <p class="text-capitalize">Share your experience with doctor and give him a chance to improve.</p>             
                <p class="text-success">Improve healthcare system!</p>                               
            </div>
        </div>
        <!-- /.row -->
        <hr>
       <!-- /.row -->
       <div class="row">&nbsp</div>
        <div class="row">&nbsp</div>
         <div class="row">
            <div class="col-md-5">                            
                <h3 class="text-danger">ASK QUESTION FROM DOCTOR</h3>                
                <ul>
                    <li><strong>1.POST YOUR QUESTION</strong>
                    </li>
                    <p>Write down your symptoms and enter your history to get doctor advice.</p>
                    <li><strong>2.GET REPLY</strong>
                    </li>
                    <p>You will be Replied By multiple doctors about Your Prbolem!</p>                    
                    <li><strong>3.GET GUIDANCE</strong>
                    </li>
                    <p>Choose an Appropriate doctor and request for an appointment IF NEEDED</p>
                </ul>
                <a class="btn btn-warning" href="HealthForm.aspx">Post Question</a>
            </div>
             <div class="col-md-7">               
                <a href="HealthForm.aspx">
                    <img class="img-responsive img-hover" src="Images/Website/landingpage/4.png" alt="">
                </a>
            </div>
        </div>
        <!-- /.row -->
        <hr>
        <!-- Features Section -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">PUNJAB PATIENT PORTAL Features</h2>
            </div>
            <div class="col-md-6">
                <p><b>Punjab patient Portal</b> is a web application that help doctors in scheduling their working hours and view medical progress and provide Patients a remote access to the doctor and a remote communication with the doctor.</p>
                <p class="text-danger">It includes:</p>
                <ul>
                    <li><strong>Search For near authentic Doctor</strong> </li>
                    <li><strong>Get Appointment Online</strong> </li>
                    <li><strong>Give FeedBack</strong> </li>
                    <li><strong>Send Mails</strong> </li>
                    <li><strong>Chat Instantly</strong> </li>
                    <li><strong>Read Health Blogs</strong> </li>
                    <li><strong>Post Health Related Questions</strong> </li>
                </ul>
                <p>The system allows doctors to register in the system and provide personal details such as their expertise and fee to the system and after registering in the system allow doctors to manage their slots in which they are available to the patients online.</p>
                <p>The system also allows patients to register in the system and provide personal details. </p>
            </div>
            <div class="col-md-6">
                <img class="img-responsive" src="Images/Website/landingpage/s5.png" alt="">
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Call to Action Section -->
        <div class="well">
            <div class="row">
                <div class="col-md-8">
                    <p>Doctors can <b>JOIN US</b> by filling a form and sending us a request. Our team will contact you and after cinfirmation and satisfaction may provide you with an Account.</p>
                </div>
                <div class="col-md-4">
                    <a class="btn btn-lg btn-danger btn-block" href="DoctorSignUpRequest.aspx">Call to Action</a>
                </div>
            </div>
        </div>
       </div>
        
        <hr>
       <footer>   
        <div class="footer-pos">           
            <p class="pull-right"><a href="#">Back to top</a>&nbsp&nbsp</p>
            <p>&nbsp&nbsp&nbsp&nbsp&copy; 2017 punjabpatientportal.com &middot; <a href="AboutUs.aspx">About Us</a> &middot; <a href="ContactUs.aspx">Contact Us</a> &middot; <a href="Services.aspx">Our Services</a></p>
        </div>
           
    </footer>
    </form>
</body>
</html>
