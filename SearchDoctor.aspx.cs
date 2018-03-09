using System;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace SignalRChat
{
    public partial class SearchDoctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                populatecitylist();
                populatespecializationlist();
                Hideall();
                
            }
        }

        protected void Hideall()
        {
            ddlgender.Visible = false;
            lbGender.Visible = false;
            ddlDiseases.Visible = false;
            lbDiseases.Visible = false;
            ddlFeeMax.Visible = false;
            lbFee.Visible = false;
            ddlFeeMin.Visible = false;
            ddlFilterBy.Visible = false;
            lbfilter.Visible = false;
            ddlServices.Visible = false;
            lbServices.Visible = false;
            ddlspecialization.Visible = false;
            lbSpecial.Visible = false;
        }

        protected void populatecitylist()
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select CityName from Cities", con);
                    con.Open();
                    ddlcity.DataSource = cmd.ExecuteReader();
                    ddlcity.DataTextField = "CityName";
                    ddlcity.DataValueField = "CityName";
                    ddlcity.DataBind();
                    ddlcity.Items.Insert(0, new ListItem("All", "All"));
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
            
        }

        protected void populatespecializationlist()
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select CategoryName from Categories", con);
                    con.Open();
                    ddlspecialization.DataSource = cmd.ExecuteReader();
                    ddlspecialization.DataTextField = "CategoryName";
                    ddlspecialization.DataValueField = "CategoryName";
                    ddlspecialization.DataBind();
                    ddlspecialization.Items.Insert(0, new ListItem("All", "All"));
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
            
        }
        protected void ddlSearchFor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSearchFor.SelectedValue == "Hospital")
            {
                ddlgender.Visible = false;
                lbGender.Visible = false;
                ddlFeeMin.Visible = false;
                lbFee.Visible = false;
                ddlFeeMax.Visible = false;
                ddlspecialization.Visible = false;
                lbSpecial.Visible = false;
            }
            else if (ddlSearchFor.SelectedValue == "Doctor")
            {
                ddlgender.Visible = true;
                lbGender.Visible = true;
                ddlFeeMin.Visible = true;
                ddlFeeMax.Visible = true;
                lbFee.Visible = true;
                ddlspecialization.Visible = true;
                lbSpecial.Visible = true;
            }
        }
        protected void ddlspecialization_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlspecialization.SelectedValue!="All")
            {
                populateDiseasesList();
                populateServicesList();
                ddlFilterBy.Visible = true;
                lbfilter.Visible = true;
            }
            if (ddlspecialization.SelectedValue == "All")
            {
                ddlFilterBy.Visible = false;
                lbfilter.Visible = false;
                ddlDiseases.Visible = false;
                lbDiseases.Visible = false;
                ddlServices.Visible = false;
                lbServices.Visible = false;
            }
            
            
        }

        protected void populateDiseasesList()
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select DiseaseName from Diseases where Category='" + ddlspecialization.SelectedValue + "'", con);
                    con.Open();
                    ddlDiseases.DataSource = cmd.ExecuteReader();
                    ddlDiseases.DataTextField = "DiseaseName";
                    ddlDiseases.DataValueField = "DiseaseName";
                    ddlDiseases.DataBind();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
            
        }

        protected void populateServicesList()
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select ServiceName from Services where Category='" + ddlspecialization.SelectedValue + "'", con);
                    con.Open();
                    ddlServices.DataSource = cmd.ExecuteReader();
                    ddlServices.DataTextField = "ServiceName";
                    ddlServices.DataValueField = "ServiceName";
                    ddlServices.DataBind();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
           
        }
        protected void ddlFilterBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFilterBy.SelectedValue == "None")
            {
                ddlDiseases.Visible = false;
                lbDiseases.Visible = false;
                ddlServices.Visible = false;
                lbServices.Visible = false;
            }
            else if (ddlFilterBy.SelectedValue == "Services")
            {
                ddlDiseases.Visible = false;
                lbDiseases.Visible = false;
                ddlServices.Visible = true;
                lbServices.Visible = true;
            }
            else if (ddlFilterBy.SelectedValue == "Diseases")
            {
                ddlDiseases.Visible = true;
                lbDiseases.Visible = true;               
                ddlServices.Visible = false;
                lbServices.Visible = false;
            }
        }

        

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            if(ddlSearchFor.SelectedValue=="Hospital")
            {
                SearchForHospital();
            }
            else if(ddlSearchFor.SelectedValue == "Doctor")
            {
                SearchForDoctor();
            }      

        }


        protected void SearchForHospital()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "Select * from Institutes";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    DataView dv = new DataView(dt);
                    if (ddlcity.SelectedValue != "All")
                    {
                        dv.RowFilter = "City='" + ddlcity.SelectedValue + "'";
                    }
                    dt = dv.ToTable();
                    GridViewDoctor.DataSource = null;
                    GridViewDoctor.DataBind();
                    GridViewHospital.DataSource = dt;
                    GridViewHospital.DataBind();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
           

        }

        protected void SearchForDoctor()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "Select DoctorProfile.*,UserAccounts.Username from DoctorProfile inner join UserAccounts on DoctorProfile.UserId=UserAccounts.UserId";

                    if (ddlFilterBy.SelectedValue == "Services" && ddlspecialization.SelectedValue != "All")
                    {
                        query = "Select DoctorProfile.*,DoctorOfferServices.ServiceName,UserAccounts.Username from ((DoctorProfile inner join DoctorOfferServices on DoctorProfile.DoctorId=DoctorOfferServices.DoctorId) inner join UserAccounts on DoctorProfile.UserId=UserAccounts.UserId)";
                    }
                    if (ddlFilterBy.SelectedValue == "Diseases" && ddlspecialization.SelectedValue != "All")
                    {
                        query = "Select DoctorProfile.*,Diseases.DiseaseName,UserAccounts.Username from DoctorProfile inner join DoctorCureDiseases on DoctorProfile.DoctorId=DoctorCureDiseases.DoctorId inner join UserAccounts on DoctorProfile.UserId=UserAccounts.UserId";
                    }
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (ddlcity.SelectedValue != "All")
                    {
                        DataView dv = new DataView(dt);
                        dv.RowFilter = "City='" + ddlcity.SelectedValue + "'";
                        dt = dv.ToTable();
                    }
                    if (ddlgender.SelectedValue != "Both")
                    {
                        DataView dv = new DataView(dt);
                        dv.RowFilter = "Gender= '" + ddlgender.SelectedValue + "'";
                        dt = dv.ToTable();
                    }
                    if (ddlFeeMin.SelectedValue != "--Minimum--" && ddlFeeMin.SelectedValue != "Don,t Filter" && ddlFeeMax.SelectedValue != "--Maximum--" && ddlFeeMax.SelectedValue != "Don,t Filter")
                    {
                        DataView dv = new DataView(dt);
                        dv.RowFilter = "FeeMin >= '" + ddlFeeMin.SelectedValue + "' AND FeeMax <= '" + ddlFeeMax.SelectedValue + "'";
                        dt = dv.ToTable();
                    }
                    if (ddlspecialization.SelectedValue != "All")
                    {
                        DataView dv = new DataView(dt);
                        dv.RowFilter = "Specialization= '" + ddlspecialization.SelectedValue + "'";
                        dt = dv.ToTable();
                    }
                    if (ddlFilterBy.SelectedValue == "Diseases" && ddlspecialization.SelectedValue != "All")
                    {
                        DataView dv = new DataView(dt);
                        dv.RowFilter = "DiseaseName= '" + ddlDiseases.SelectedValue + "'";
                        dt = dv.ToTable();
                    }
                    if (ddlFilterBy.SelectedValue == "Services" && ddlspecialization.SelectedValue != "All")
                    {
                        DataView dv = new DataView(dt);
                        dv.RowFilter = "ServiceName= '" + ddlServices.SelectedValue + "'";
                        dt = dv.ToTable();
                    }
                    DataView dv2 = new DataView(dt);
                    dv2.Sort = "Recommendations DESC";
                    dt = dv2.ToTable();
                    GridViewHospital.DataSource = null;
                    GridViewHospital.DataBind();
                    GridViewDoctor.DataSource = dt;
                    GridViewDoctor.DataBind();

                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
            

        }
        protected void FireRowCommandForHospital(object sender, GridViewCommandEventArgs e)

        {           
            string command = e.CommandName;
            string HospitalId = e.CommandArgument.ToString();
            switch (command)
            {
                case "ViewDetails":
                    {
                        Session["SelectedHospitalForDetailView"] = HospitalId;                        
                        Response.Redirect("~/HospitalDetails.aspx");
                        break;
                    }
                                                        
            }
        }


        protected void FireRowCommandForDoctor(object sender, GridViewCommandEventArgs e)

        {
            string command = e.CommandName;
            string DoctorId = e.CommandArgument.ToString();
            switch (command)
            {
                case "ViewDetails":
                    {
                        Session["SelectedDoctorForDetailView"] = DoctorId;
                        Response.Redirect("~/DoctorDetail.aspx");
                        break;
                    }

            }
        }



    }
}