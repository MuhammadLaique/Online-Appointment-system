<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorDetail.aspx.cs" Inherits="SignalRChat.DoctorDetail" %>

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
      function AppointmentButtonClick()
        {
          $("#AppointmentSection").show();
      }
      $(document).ready(function () {
          $('#<%= AppointmetMethod.ClientID %>').on('change', function () {
              if (this.value == 'PPP')               
              {
                  $("#PPPSection").show();
                  $("#PhoneSection").hide();
                  $("#VisitSection").hide();
              }
              else if (this.value == 'P')
              {
                  $("#PPPSection").hide();
                  $("#PhoneSection").show();
                  $("#VisitSection").hide();
              }
              else if (this.value == 'V') {
                  $("#PPPSection").hide();
                  $("#PhoneSection").hide();
                  $("#VisitSection").show();
              }
          });
      });
    </script>
            
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
                    <h1 class="page-header">Dr.<%=name%>
                   
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
                    <img class="img-responsive img-hover img-circle" src='Images/Doctors/<%=username%>.jpg' height="1"/>
                    </a>
             </div>          
                <div class="col-md-4">
                    
                <h3>Dr.<%=name%></h3>
                <p>
                    <%=addressp%>,<%=city %>
                </p>
                <p><i class="fa fa-phone"></i> 
                    <abbr title="Phone">Phone</abbr>: <%=phone1%>||<%=phone2%></p>                
                <p><i class="fa fa-envelope-o"></i> 
                    <abbr title="Email">Email</abbr>: <a href="mailto:"+<%=emailp%>><%=emailp%></a>||<a href="mailto:"+<%=emails%>><%=emails%></a></p>                   
                <p><i class="fa fa-clock-o"></i> 
                    <abbr title="Age">Age</abbr>: <%=age%></p>
                    <p><i class="fa fa-clock-o"></i> 
                    <abbr title="Gender">Gender</abbr>: <%=gender%></p>
                    <p><i class="fa fa-clock-o"></i> 
                    <abbr title="Specialization">Specialization</abbr>: <%=specialization%></p>
                    <p><i class="fa fa-clock-o"></i> 
                    <abbr title="Qualification">Qualification</abbr>: <%=qualification%></p>
                    <p><i class="fa fa-clock-o"></i> 
                    <abbr title="Experience">Experience</abbr>: <%=experience%></p>
                    <p><i class="fa fa-clock-o"></i> 
                    <abbr title="Fee">Fee</abbr>Rs: <%=feemin%>-<%=feemax%></p>
                    <p><i class="fa fa-clock-o"></i> 
                    <abbr title="Recommendations">Recommendations</abbr>: <%=recommendations%></p>
                <ul class="list-unstyled list-inline list-social-icons">
                    <li><a href="#"><i class="fa fa-facebook-square fa-2x"></i></a> </li>
                    <li><a href="#"><i class="fa fa-linkedin-square fa-2x"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter-square fa-2x"></i></a></li>
                    <li> <a href="#"><i class="fa fa-google-plus-square fa-2x"></i></a></li>
                </ul>
                    <button id="GetAppointment" type="button" class="btn btn-danger" onclick="AppointmentButtonClick()">
                    <span class="fa fa-bell"></span>Get Appointment
                    </button>
            </div>
        </div>
    <br />
    <div class="well" id="AppointmentSection" style="display:none">
            <div class="form-group">
            <label>Get Appointment Through:</label>
            <select class="form-control" id="AppointmetMethod" runat="server">
                 <option value="--Select Method--">--Select Method--</option>
                <option value="PPP">Punjab Patient Portal</option>
                <option value="P">Phone</option>
                <option value="V">Visit</option>
            </select>
            </div>
                <div id="PhoneSection" style="display:none">
                    <label>Call On:<b><u><%=phone1%>||<%=phone2%></u></b></label> 
                </div>
                <div id="VisitSection" style="display:none">
                    <label><b><u>For Visit See Address Below..</u></b></label> 
                </div>
                <div id="PPPSection" style="display:none">
                    <div class="form-group">
                    <label>Suitable Date For Appointment:</label>
                    <asp:TextBox ID="TextBoxAppointment" runat="server" Class="form-control" placeholder="Keep in Mind Schedule Of Doctor" TextMode="DateTimeLocal"></asp:TextBox>
                    </div>
                    <div class="form-group">
                    <label for="Message">Message:</label>
                    <textarea class="form-control" rows="5" id="Message" runat="server" placeholder="Enter Your Problem and other necessary Details"></textarea>
                    </div>
                <asp:Button ID="btnAppointment" runat="server" Class="btn btn-success" Text="Request Appointment" OnClick="btnAppointment_Click" />
                <asp:Label ID="AppointmentSectionValidator" runat="server"></asp:Label>
                </div>
                     
                
    </div>

    <div class="row">&nbsp</div>
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Dr.<%=name%> Work's Here:</h3>
        </div>
    </div>

    <div class="row">
        <div class="col-md-9">
<asp:GridView ID="GridViewSchedule" ShowHeader="false" GridLines="None" AutoGenerateColumns="false" runat="server" OnRowCommand="FireRowCommandForSchedule" DataKeyNames="InstituteId">
<Columns>
<asp:TemplateField>
<ItemTemplate>                                                                
    <div class="well">  
    <div class="row">                                          
    <div class="col-md-1 text-center">
        <p>
            <i class="fa fa-building fa-5x"></i>
        </p>
        <p><label><%#Eval("Type").ToString()%></label>
        </p>                            
    </div>
                                            
                                            
    <div class="col-md-2">
        <a href="#">
            <img class="img-responsive img-hover img-circle" src='Images/noimage.jpg' alt="" height="1">
        </a>
        &nbsp;</div>
                                            
                  
    <div class="col-md-6">
        <h3>
            <label><%#Eval("InstituteName").ToString()%></label>
            <small><label class="text-danger"><%#Eval("City").ToString()%></label></small>
        </h3>
        <p><i class="fa fa-clock-o"></i> 
                    <abbr title="Designation">Dr.<%=name%>'s Designation</abbr>: <%#Eval("Designation")%></p>
        <p><i class="fa fa-clock-o"></i> 
                    <abbr title="Location">Location</abbr>: <%#Eval("Address")%></p>              
        <ul class="list-unstyled list-inline list-social-icons">
                    <li><a href="#"><i class="fa fa-facebook-square fa-2x"></i></a> </li>
                    <li><a href="#"><i class="fa fa-linkedin-square fa-2x"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter-square fa-2x"></i></a></li>
                    <li> <a href="#"><i class="fa fa-google-plus-square fa-2x"></i></a></li>
                </ul>
        <asp:LinkButton ID="btnLoc" runat="server" Class="btn btn-warning" Text="Get Location" CommandArgument='<%# Eval("InstituteId") %>' CommandName="ViewDetails"/>      
    </div>                                                       
    </div>
        <hr />    
        
         <h3 class="text-danger"> Schedule:</h3> 
        <br />  
        <div class="row ">
            <div class="col-md-6">
            <label>Days</label>
                </div>
            <div class="col-md-6">
            <label>Timing</label>
                </div>
        </div>
        <div class="row bg-primary">
            <div class="col-md-6">
            <label>Monday</label>
                </div>
            <div class="col-md-6">
            <label><%#Eval("MondayFrom")%>-<%#Eval("MondayTo")%></label>
                </div>
        </div>            
        <div class="row bg-danger">
            <div class="col-md-6">
            <label>Tuesday</label>
                </div>
            <div class="col-md-6">
            <label><%#Eval("TuesdayFrom")%>-<%#Eval("TuesdayTo")%></label>
                </div>
        </div>            
        <div class="row bg-primary">
            <div class="col-md-6">
            <label>Wednesday</label>
                </div>
            <div class="col-md-6">
            <label><%#Eval("WednesdayFrom")%>-<%#Eval("WednesdayTo")%></label>
                </div>
        </div>            
        <div class="row bg-danger">
            <div class="col-md-6">
            <label>Thursday</label>
                </div>
            <div class="col-md-6">
            <label><%#Eval("ThursdayFrom")%>-<%#Eval("ThursdayTo")%></label>
                </div>
        </div>            
        <div class="row bg-primary">
            <div class="col-md-6">
            <label>Friday</label>
                </div>
            <div class="col-md-6">
            <label><%#Eval("FridayFrom")%>-<%#Eval("FridayTo")%></label>
                </div>
        </div>            
        <div class="row bg-danger">
            <div class="col-md-6">
            <label>Saturday</label>
                </div>
            <div class="col-md-6">
            <label><%#Eval("SaturdayFrom")%>-<%#Eval("SaturdayTo")%></label>
                </div>
        </div>            
        <div class="row bg-primary">
            <div class="col-md-6">
            <label>Sunday</label>
                </div>
            <div class="col-md-6">
            <label><%#Eval("SundayFrom")%>-<%#Eval("SundayTo")%></label>
                </div>
        </div>                        
</div> 
<br />                                                                                                                   
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
</div>
            <div class="col-md-3">
                <div class="row">
                <div class="well">
                <h4 class="page-header"><p class="text-danger"><b>REPORT INCORRECT INFO</b></p></h4> 
                <p>If you think information needs to be updated. Please Suggest An Edit.</p>             
                <a class="btn btn-danger" href="Suggestions.aspx">Suggest An Edit</a>
                </div>
                </div>
                <div class="row">
                <div class="well">
                <h4 class="page-header"><p class="text-success"><b>REVIEW DOCTOR</b></p></h4>              
                <select runat="server" class="form-control" id="RecomendationOption">
                <option value="0">--Your Recommendation--</option>
                <option value="I Recommend">I Recommend</option>
                <option value="I Discourage">I Discourage</option>               
                </select>
                <br /> 
                <textarea class="form-control" rows="5" id="tareason" runat="server" aria-required="true" placeholder="Give Reason for Your Recommendation or discouragement.e.g I met the doctor and he/she gave me good medicine."></textarea>
                <br />                          
                <asp:Button ID="ReviewButton" runat="server" CssClass="btn btn-success" OnClick="ReviewButton_Click" Text="Give FeedBack" />
                <asp:Label ID="ReviewValidator" runat="server"></asp:Label>
                </div>
                </div>
            </div>
        
</div>
    
<br />
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Dr.<%=name%>'s Services:</h3>
        </div>
    </div>

        <div class="col-md-6">
        <div class="well">
        <div class="row ">
        <div class="col-md-3">      
        <asp:GridView ID="GridViewServices" ShowHeader="false" GridLines="None" AutoGenerateColumns="false" runat="server">
        <Columns>
        <asp:TemplateField>
        <ItemTemplate>                
        <p><i class="fa fa-2x fa-check"></i> 
        <abbr title="Service"><%#Eval("ServiceName")%></abbr></p>
        </div>
        </div>      
        </ItemTemplate>
        </asp:TemplateField>
        </Columns>
        </asp:GridView>   
        </div>
        <div class="col-md-3">      
        <asp:GridView ID="GridViewDiseases" ShowHeader="false" GridLines="None" AutoGenerateColumns="false" runat="server">
        <Columns>
        <asp:TemplateField>
        <ItemTemplate>                
        <p><i class="fa fa-2x fa-check"></i> 
        <abbr title="Disease" class="text-danger"><%#Eval("DiseaseName")%></abbr></p>
        </div>
        </div>      
        </ItemTemplate>
        </asp:TemplateField>
        </Columns>
        </asp:GridView>   
        </div>
        </div>
        </div>
        </div>
    <br />
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Dr.<%=name%>'s Reviews:</h3>
        </div>
    </div>
    
    <div class="row">
    <asp:GridView ID="GridViewReviews" ShowHeader="false" GridLines="None" AutoGenerateColumns="false" runat="server">
    <Columns>
    <asp:TemplateField>
    <ItemTemplate>              
    <div class="media">
        <a class="pull-left" href="#">
            <img class="media-object" src="http://placehold.it/64x64">
        </a>
        <div class="media-body">
            <h4 class="media-heading"><label class="text-danger"> <%#Eval("Name")%></label></h4>
            <p><small><%#Eval("Recommendation")%><small></p>
            <p><%#Eval("Reason")%></p
        </div>
    </div>
    </ItemTemplate>
    </asp:TemplateField> 
    </Columns>  
    </asp:GridView>
    </div>    
    <br />
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header"><b>Similar Docotors:</b></h3>
        </div>
    </div>
    <div class="row">
<asp:GridView ID="GridViewDoctor" ShowHeader="false" GridLines="None" AutoGenerateColumns="false" runat="server" OnRowCommand="FireRowCommandForDoctor" DataKeyNames="DoctorId">
<Columns>
<asp:TemplateField>
<ItemTemplate>                                                                
    <div class="well">  
    <div class="row">                                          
    <div class="col-md-1 text-center">
        <p>
            <i class="fa fa-user-md fa-5x"></i>
        </p>
        <p><label>Doctor</label>
        </p>
        
            <label>In:</label> <label class="text-danger"><%#Eval("City")%></label>     
         
                             
    </div>
                                            
                                            
    <div class="col-md-2">
        <a href="#">
            <img class="img-responsive img-hover img-circle" src='Images/Doctors/<%#Eval("UserName")%>.jpg' alt="" height="1">
        </a>
        &nbsp;</div>
                                            
                                            
    <div class="col-md-4">
        <h3>
            <label class="text-danger">Dr.<%#Eval("Name")%></label>
            <small class="text-warning"><%#Eval("Qualification").ToString()%></small>
        </h3>
        <p> <label>Specialization:&nbsp</label><label class="text-primary"><%#Eval("Specialization")%></label></p>
        <p><label>Experience:&nbsp</label><label class="text-primary"><%#Eval("Experience")%>&nbsp Years</label></p>
        <p><label>Recommendations:&nbsp</label><label class="text-primary"><%#Eval("Recommendations")%></label></p>
        <p><label>Fee:&nbsp</label><label class="text-primary">Rs.<%#Eval("FeeMin")%>-<%#Eval("FeeMax")%></label></p>
        <asp:LinkButton ID="btnView23232" runat="server" Class="btn btn-success" Text="ViewDetails" CommandArgument='<%# Eval("DoctorId") %>' CommandName="ViewDetails"/>
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
