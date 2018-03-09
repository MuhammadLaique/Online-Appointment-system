<%@ Page Title="" Language="C#" MasterPageFile="~/Main2.Master" AutoEventWireup="true" CodeBehind="SearchDoctor.aspx.cs" Inherits="SignalRChat.SearchDoctor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!--- Content -->
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
                                <asp:DropDownList ID="ddlSearchFor" runat="server" AutoPostBack="true" CssClass="list-unstyled" Font-Size="Large" OnSelectedIndexChanged="ddlSearchFor_SelectedIndexChanged">
                                <asp:ListItem Text="Hospital" Value="Hospital"></asp:ListItem>
                                <asp:ListItem Text="Doctor" Value="Doctor"></asp:ListItem>
                                </asp:DropDownList>                             
                                </div>                               
                                <div class="form-group">
                                <asp:Label ID="lbGender" runat="server" Text="Gender"></asp:Label>
                                <asp:DropDownList ID="ddlgender" runat="server" CssClass="list-unstyled" Font-Size="Large">
                                <asp:ListItem Text="Both" Value="Both"></asp:ListItem>
                                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                </asp:DropDownList>                                                      
                                </div>
                                <div class="form-group">
                                <asp:Label ID="lbFee" runat="server" Text="CheckUp Fee Range"></asp:Label>
                                <asp:DropDownList ID="ddlFeeMin" runat="server" CssClass="list-unstyled" Font-Size="Large">
                                <asp:ListItem Text="--Minimum--" Value="--Minimum--"></asp:ListItem>
                                <asp:ListItem Text="Don,t Filter" Value="Don,t Filter"></asp:ListItem>
                                <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                <asp:ListItem Text="500" Value="500"></asp:ListItem>
                                <asp:ListItem Text="1000" Value="1000"></asp:ListItem>
                                <asp:ListItem Text="1500" Value="1500"></asp:ListItem>
                                <asp:ListItem Text="2000" Value="2000"></asp:ListItem>
                                <asp:ListItem Text="5000" Value="5000"></asp:ListItem>
                                </asp:DropDownList>   
                                <asp:DropDownList ID="ddlFeeMax" runat="server" CssClass="list-unstyled" Font-Size="Large">
                                <asp:ListItem Text="--Maximum--" Value="--Maximum--"></asp:ListItem>
                                <asp:ListItem Text="Don,t Filter" Value="Don,t Filter"></asp:ListItem>                               
                                <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                <asp:ListItem Text="500" Value="500"></asp:ListItem>
                                <asp:ListItem Text="1000" Value="1000"></asp:ListItem>
                                <asp:ListItem Text="1500" Value="1500"></asp:ListItem>
                                <asp:ListItem Text="2000" Value="2000"></asp:ListItem>
                                <asp:ListItem Text="5000" Value="5000"></asp:ListItem>
                                <asp:ListItem Text="10000" Value="10000"></asp:ListItem>
                                </asp:DropDownList>  
                                </div>                               
                                <div class="form-group">
                                <asp:Label ID="lbSpecial" runat="server" Text="Specialization"></asp:Label>
                                <asp:DropDownList ID="ddlspecialization" runat="server" AutoPostBack="true" CssClass="list-unstyled" Font-Size="Large" OnSelectedIndexChanged="ddlspecialization_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                <asp:Label ID="lbfilter" runat="server" Text="Filter By"></asp:Label>
                                <asp:DropDownList ID="ddlFilterBy" runat="server" AutoPostBack="true" CssClass="list-unstyled" Font-Size="Large" OnSelectedIndexChanged="ddlFilterBy_SelectedIndexChanged">
                                <asp:ListItem Text="None" Value="None"></asp:ListItem>
                                <asp:ListItem Text="Services" Value="Services"></asp:ListItem>
                                <asp:ListItem Text="Diseases" Value="Diseases"></asp:ListItem>
                                </asp:DropDownList>
                                </div>                                
                                <div class="form-group">
                                <asp:Label ID="lbDiseases" runat="server" Text="Diseases"></asp:Label>
                                <asp:DropDownList ID="ddlDiseases" runat="server" CssClass="list-unstyled" Font-Size="Large"></asp:DropDownList>                             
                                </div>
                                <div class="form-group">
                                <asp:Label ID="lbServices" runat="server" Text="Services"></asp:Label>
                                <asp:DropDownList ID="ddlServices" runat="server" CssClass="list-unstyled" Font-Size="Large"></asp:DropDownList>                           
                                </div>
                                <div class="form-group">
                                <asp:Button ID="SearchButton" runat="server" CssClass="btn btn-success" OnClick="SearchButton_Click" Text="Find" />
                                </div>
                             </div>
                            </div>
                         </div>
                 

<div class="row">
<asp:GridView ID="GridViewHospital" ShowHeader="false" GridLines="None" AutoGenerateColumns="false" runat="server" OnRowCommand="FireRowCommandForHospital" DataKeyNames="InstituteId">
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
        </h3>
        <p>
            <label class="text-danger"><%#Eval("City").ToString()%></label>
        </p>
        <p><label class="text-warning"><%#Eval("Address").ToString()%></label>
        </p>
        <asp:Button ID="btnView" runat="server" Class="btn btn-success" Text="ViewDetails" CommandArgument='<%# Eval("InstituteId") %>' CommandName="ViewDetails"/>
       
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
        <asp:Button ID="btnView2" runat="server" Class="btn btn-success" Text="ViewDetails" CommandArgument='<%# Eval("DoctorId") %>' CommandName="ViewDetails"/>
    </div>
                                            
                                            
        </div>              
            
</div>
<hr />                                                              
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
</div>




    
        
        
        


    










    <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table>
            <tr>
                <td>Country:</td>
                <td><asp:DropDownList ID="ddlspecialization" runat="server" AutoPostBack = "true" OnSelectedIndexChanged = "ddlspecialization_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>State:</td>
                <td>
                    <asp:DropDownList ID="ddlDiseases" runat="server" AutoPostBack = "true">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>City:</td>
                <td>
                    <asp:DropDownList ID="ddlServices" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>--%>





















        

       <%-- <div class="form-group">
            <label for="SelectMedicalProblemList">Select your Problem Area:l>
            <select runat="server" class="form-control col-xs-2" id="SelectProblem" name="selectproblem">
                <option value="All">All </option>
                <option value="Cardiology">Cardiology </option>
                <option value="Dentistry">Dentistry</option>
                <option value="Physicial">Physicial</option>
                <option value="Orthodology">Orthodology</option>
            </select>
        </div>

        <hr />
        <div class="form-group">
            <label for="SelectMedicalProblemList">Select your Problem Area:</label>
            <select runat="server" class="form-control col-xs-2" id="SelectGender" name="selectproblem">
                <option value="Both">Both </option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select>
        </div>--%>

        <%--<div>
            <label for="c1" >Select suitable methods for fee payment:</label>
                <div class="checkbox" >                
                <label><input type="checkbox" value="" runat="server" id="c1" name="c1" form="form1"/>By cash</label>
                <label><input type="checkbox" value="" runat="server" id="ChkBxElectronically" name="c1" form="form1" onclick="ShowHideDiv(this)"/>Electronically</label>     
                </div>         
  
            <div id="FeesubmissionDivision" style="display: none">
            <label for="Checkbox1" >Suitable Electronic Payment Methods:</label>
            <div  class="checkbox" >
                <label><input type="checkbox" value="" runat="server" id="Checkbox1" name="c1" form="form1"/>Easy Paisa</label>
                <label><input type="checkbox" value="" runat="server" id="Checkbox2" name="c1" form="form1" />MobiCash</label>
                <label><input type="checkbox" value="" runat="server" id="Checkbox3" name="c1" form="form1" />PayPal</label>     
            </div>
                </div>--%>
        <hr />




       <%-- <div class="form-group row">
            <div class="col-xs-2">
                <label for="SelectMedicalProblemList">Select Checkup fee range:</label>
                <br />
                <label for="SelectMedicalProblemList">From:</label>
                <select runat="server" class=" form-control " id="SelectFeeMin" name="selectproblem">
                    <option value="sialkot">Rs.100 </option>
                    <option value="lahore">Rs.500</option>
                    <option value="islamabad">Rs.1000</option>
                    <option value="gujrat">Rs.2000</option>
                </select>
                <label for="SelectMedicalProblemList">To    :</label>
                <select runat="server" class="form-control" id="SelectFeeMax" name="selectproblem">
                    <option value="sialkot">Rs.100 </option>
                    <option value="lahore">Rs.500</option>
                    <option value="islamabad">Rs.1000</option>
                    <option value="gujrat">Rs.2000</option>
                </select>
            </div>
        </div>



        <div>
            
        </div>--%>

































































        <%--<div>
            <asp:GridView ID="GridView1" runat="server" OnRowCommand="FireRowCommand" DataKeyNames="DoctorId">

                <Columns>

                    <asp:TemplateField HeaderText="Mark as Deleted">

                        <ItemTemplate>

                            <asp:LinkButton ID="btnDeleted" runat="server" CommandArgument='<%# Eval("DoctorId") %>'
                                CommandName="MarkAsDeleted" Text="Mark As Deleted" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mark as Archived">

                        <ItemTemplate>

                            <asp:LinkButton ID="btnArchived" runat="server" CommandArgument='<%# Eval("DoctorId") %>'
                                CommandName="MarkAsArchived" Text="Mark as Archived" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>--%>
    <%--<div class="row">
    <div class="col-lg-4 col-lg-offset-2">
    <table>
    <tr>
    <td>
     <asp:GridView ID="GridView1" ShowHeader="false" OnRowCommand="FireRowCommand" DataKeyNames="DoctorId"
        GridLines="None" AutoGenerateColumns="false"
        runat="server">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="jumbotron" style="width:900px; height:250px">
                    <table class="table-responsive" style="width:900px; height:200px">
                        <tr>
                            <td style="width: 70px">
                                <asp:Image ID="imgEmployee" CssClass="img-responsive img img-circle" Width="200" Height="150"
                                    ImageUrl="~/Images/noimage.jpg" 
                                    runat="server" />
                            </td>
                            <td style="width: 200px">
                                <table>
                                    <tr>                                        
                                        <td>
                                            <h2>
                                                <u>
                                                    <b>
                                            <asp:Label ID="lblId" CssClass="text-warning" runat="server" Text='<%#Eval("Name").ToString()%>'> 
                                            </asp:Label>
                                                    </b>   
                                                   </u>          
                                            </h2>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>                                       
                                            <b>Qualification:</b>
                                        </td>
                                        <td>
                                           <asp:Label ID="Label1" runat="server" Text='<%#Eval("Qualification") %>'> 
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                             <b>Specialization:</b>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblName" 
                                            runat="server" 
                                            Text='<%#Eval("Specialization") %>'>
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Fee:</b>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblGender" 
                                            runat="server" 
                                            Text=''>
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Address:</b>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCity" 
                                            runat="server" 
                                            Text='<%#Eval("OffAddress").ToString()+Eval("City").ToString()+"                  "+"."%>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <span "    " style="display:inline-block;"></span>
                                        </td>
                                        <td>                                  
                                            <asp:LinkButton ID="ButtonViewDetails" CssClass="btn btn-success" runat="server" CommandArgument='<%# Eval("DoctorId") %>'
                                            CommandName="ViewDetails" Text="View Details" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>                 
                    </table>
                         </div>
                </ItemTemplate>              
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</td>
        </tr>
        </table>


</div>
        </div>
        --%>









        <!--- Content -->
    <script type="text/javascript">
        function ShowHideDiv(chkPassport) {
            var dvPassport = document.getElementById("FeesubmissionDivision");
            dvPassport.style.display = chkPassport.checked ? "block" : "none";
        }
    </script>
</asp:Content>
