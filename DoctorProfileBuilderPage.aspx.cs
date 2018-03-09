using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SignalRChat
{
    public partial class DoctorProfileBuilderPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                PopulateCityList();
                PopulateCategoryList();
                    
            }

            
        }

        protected void PopulateCityList()
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select CityName from Cities", con);
                    con.Open();
                    ddlcity2.DataSource = cmd.ExecuteReader();
                    ddlcity2.DataTextField = "CityName";
                    ddlcity2.DataValueField = "CityName";
                    ddlcity2.DataBind();
                    ddlcity2.Items.Insert(0, new ListItem("Select City", "Select City"));
                    ddlcity2.Items.Add(new ListItem("Other", "Other"));
                    con.Close();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
        }


        protected void PopulateCategoryList()
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select CategoryName from Categories", con);
                    con.Open();
                    ddlcategory.DataSource = cmd.ExecuteReader();
                    ddlcategory.DataTextField = "CategoryName";
                    ddlcategory.DataValueField = "CategoryName";
                    ddlcategory.DataBind();
                    ddlcategory.Items.Insert(0, new ListItem("Select Category", "Select Category"));
                    ddlcategory.Items.Add(new ListItem("Other", "Other"));
                    con.Close();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
        }


        protected void ButtonAddCity_Click(object sender, EventArgs e)
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into Cities values('" + TextBoxCity.Text + "')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    PopulateCityList();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
        }
        protected void ButtonAddCategory_Click(object sender, EventArgs e)
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into Categories values('" + TextBoxCategory.Text + "')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    PopulateCategoryList();

                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
        }


        protected void ButtonSubmitProfile_Click(object sender, EventArgs e)
        {

            InsertProfileData();

        }
        private void InsertProfileData()
        {
            if(ddlcity2.Value != "Select City" && ddlcity2.Value != "Other" && ddlcategory.SelectedValue != "Select Category" && ddlcategory.SelectedValue != "Other")
            {
                try
                {
                    String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("insert into DoctorProfile (UserId,Name,DOB,Gender,EmailP,EmailS,Phone1,Phone2,AddressPersonal,City,Specialization,Qualification,Experience,FeeMin,FeeMax,Recommendations) values('" + Session["UserId"] + "','" + TextBoxName.Text + "','" + TextBoxDOB.Text + "','" + selectGender.Value + "','" + TextBoxEmailPrimary.Text + "','" + TextBoxEmailSecondary.Text + "','" + TextBoxPhone1.Text + "','" + TextBoxPhone2.Text + "','" + TextBoxAddressPersonal.Text + "','" + ddlcity2.Value + "','" + ddlcategory.SelectedValue + "','" + TextBoxQualification.Text + "','" + TextBoxExperience.Text + "','" + TextBoxFeeMin.Text + "','" + TextBoxFeeMax.Text + "','0')", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        Session["Name"] = TextBoxName.Text;
                        Response.Redirect("~/DoctorHome.aspx");
                    }
                }
                catch (Exception ex)
                {

                    Session["Exception"] = ex;
                    Response.Redirect("~/404.aspx");
                }
                

            }


            else
             {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "Invalid City/Category Selection !";
            }
        }
            
        }
    }
