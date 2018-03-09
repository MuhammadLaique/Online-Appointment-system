using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace SignalRChat
{
    public partial class AddServices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetData();

            if (!this.IsPostBack)
            {
                PopulateSeviceList();
                PopulateDiseaseList();
            }
        }

        private void PopulateSeviceList()
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select ServiceName from Services where Category=(select Specialization from DoctorProfile where DoctorId='" + Session["DoctorId"] + "')", con);
                    con.Open();
                    ddlServices.DataSource = cmd.ExecuteReader();
                    ddlServices.DataTextField = "ServiceName";
                    ddlServices.DataValueField = "ServiceName";
                    ddlServices.DataBind();
                    ddlServices.Items.Insert(0, new ListItem("Select Services", "Select Services"));
                    ddlServices.Items.Add(new ListItem("Other", "Other"));
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
            
        }

        private void PopulateDiseaseList()
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select DiseaseName from Diseases where Category=(select Specialization from DoctorProfile where DoctorId='" + Session["Doctorid"] + "')", con);
                    con.Open();
                    ddlDiseases.DataSource = cmd.ExecuteReader();
                    ddlDiseases.DataTextField = "DiseaseName";
                    ddlDiseases.DataValueField = "DiseaseName";
                    ddlDiseases.DataBind();
                    ddlDiseases.Items.Insert(0, new ListItem("Select Diseases", "Select Diseases"));
                    ddlDiseases.Items.Add(new ListItem("Other", "Other"));
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
            
        }


        private void GetData()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string sql = "SELECT ServiceName FROM DoctorOfferServices where DoctorId='" + Session["DoctorId"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(sql, con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    sql = "SELECT DiseaseName FROM DoctorCureDiseases where DoctorId='" + Session["DoctorId"] + "'";
                    da = new SqlDataAdapter(sql, con);
                    ds = new DataSet();
                    da.Fill(ds);
                    GridView2.DataSource = ds;
                    GridView2.DataBind();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
            
        }

        protected void ButtonSelectService_Click(object sender, EventArgs e)
        {
            if (ddlServices.SelectedValue != "Select Services" && ddlServices.SelectedValue != "Other")
            {
                try
                {
                    String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("insert into DoctorOfferServices(DoctorId,ServiceName) values('" + Session["DoctorId"] + "','" + ddlServices.SelectedValue + "' )", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        GetData();
                        PopulateSeviceList();
                        PopulateDiseaseList();
                    }
                }
                catch (Exception ex)
                {

                    Session["Exception"] = ex;Response.Redirect("~/404.aspx");
                }
                
            }
            else
            {
                lblError.Text = "Invalid Service Selection !";
            }
        }

        

        protected void ButtonAddService_Click(object sender, EventArgs e)
        {
            if(TextBoxService.Text!="")
            {
                try
                {
                    String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("insert into Services(ServiceName,Category) values('" + TextBoxService.Text + "',(select Specialization from DoctorProfile where DoctorId='" + Session["DoctorId"] + "' ))", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        cmd = new SqlCommand("insert into DoctorOfferServices(DoctorId,ServiceName) values('" + Session["DoctorId"] + "','" + TextBoxService.Text + "' )", con);
                        cmd.ExecuteNonQuery();
                        GetData();
                        PopulateSeviceList();
                        PopulateDiseaseList();
                    }
                }
                catch (Exception ex)
                {

                    Session["Exception"] = ex;Response.Redirect("~/404.aspx");
                }
                
            }
            else
            {
                lblError.Text = "Enter service Name";
            }
        }

        protected void ButtonSelectDisease_Click(object sender, EventArgs e)
        {
            if (ddlServices.SelectedValue != "Select Diseases" && ddlServices.SelectedValue != "Other")
            {
                try
                {
                    String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("insert into DoctorCureDiseases(DoctorId,DiseaseName) values('" + Session["DoctorId"] + "','" + ddlDiseases.SelectedValue + "' )", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        GetData();
                        PopulateSeviceList();
                        PopulateDiseaseList();
                    }
                }
                catch (Exception ex)
                {

                    Session["Exception"] = ex;Response.Redirect("~/404.aspx");
                }
                
            }
            else
            {
                lblError.Text = "Invalid Service Selection !";
            }
        }

        protected void ButtonAddDisease_Click(object sender, EventArgs e)
        {
            if (TextBoxService.Text != "")
            {
                try
                {
                    String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("insert into Diseases(DiseaseName,Category) values('" + TextBoxDisease.Text + "',(select Specialization from DoctorProfile where DoctorId='" + Session["DoctorId"] + "' ))", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        cmd = new SqlCommand("insert into DoctorCureDiseases(DoctorId,DiseaseName) values('" + Session["DoctorId"] + "','" + ddlDiseases.SelectedValue + "' )", con);
                        cmd.ExecuteNonQuery();
                        GetData();
                        PopulateSeviceList();
                        PopulateDiseaseList();
                    }
                }
                catch (Exception ex)
                {

                    Session["Exception"] = ex;Response.Redirect("~/404.aspx");
                }
                
            }
            else
            {
                lblError.Text = "Enter Disease Name";
            }
        }


    }
}