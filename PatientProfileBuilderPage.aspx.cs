using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SignalRChat
{
    public partial class PatientProfileBuilderPage : System.Web.UI.Page
    {
        string previousPageName=null;
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + previousPageName + "');</script>");
            if (!this.IsPostBack)
            {
                PopulateCityList();
                
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
                    ddlcity.DataSource = cmd.ExecuteReader();
                    ddlcity.DataTextField = "CityName";
                    ddlcity.DataValueField = "CityName";
                    ddlcity.DataBind();
                    ddlcity.Items.Insert(0, new ListItem("Select City", "Select City"));
                    ddlcity.Items.Add(new ListItem("Other", "Other"));

                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
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

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
           
        }

        protected void ButtonSubmitProfile_Click(object sender, EventArgs e)
        {
            //if (Request.UrlReferrer != null)
            //{
                
            //    string previousPageUrl = Request.UrlReferrer.AbsoluteUri;
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + previousPageName + "');</script>");
            //    if (previousPageUrl == "ManageVisits.aspx")
            //    {
                    
                    InsertProfileDataByDoctorExternally();
            //    }
            //    else if (previousPageUrl == "PatientSignup.aspx")
            //    {                    
            //        InsertProfileDataByPatient();
            //    }
            //}
        }
        private void InsertProfileDataByPatient()
        {
            if (ddlcity.SelectedValue != "Select City" && ddlcity.SelectedValue != "Other" )
            {
               // try
                {
                    String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("insert into PatientProfile (UserId,Name,DOB,Gender,EmailP,EmailS,Phone1,Phone2,Address,City,Occupation,Qualification) values('" + Session["UserId"] + "','" + TextBoxName.Text + "','" + TextBoxDOB.Text + "','" + selectGender.Value + "','" + TextBoxEmailPrimary.Text + "','" + TextBoxEmailSecondary.Text + "','" + TextBoxPhone1.Text + "','" + TextBoxPhone2.Text + "','" + TextBoxAddress.Text + "','" + TextBoxCity.Text + "','" + TextBoxOccupation.Text + "','" + TextBoxQualification.Text + "')", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        Session["Name"] = TextBoxName.Text;
                        Response.Redirect("~/PatientHome.aspx");
                    }
                }
                //catch (Exception ex)
                //{

                //    Session["Exception"] = ex;Response.Redirect("~/404.aspx");
                //}
                


            }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "Invalid City/Category Selection !";

            }
        }

        private void InsertProfileDataByDoctorExternally()
        {
            if (ddlcity.SelectedValue != "Select City" && ddlcity.SelectedValue != "Other")
            {
               // try
                {
                    String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("insert into PatientProfile (UserId,Name,DOB,Gender,EmailP,EmailS,Phone1,Phone2,Address,City,Occupation,Qualification) values('','" + TextBoxName.Text + "','" + TextBoxDOB.Text + "','" + selectGender.Value + "','" + TextBoxEmailPrimary.Text + "','" + TextBoxEmailSecondary.Text + "','" + TextBoxPhone1.Text + "','" + TextBoxPhone2.Text + "','" + TextBoxAddress.Text + "','" + TextBoxCity.Text + "','" + TextBoxOccupation.Text + "','" + TextBoxQualification.Text + "')", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        SqlDataAdapter da = new SqlDataAdapter("Select PatientId from PatientProfile where UserId='' and Name='" + TextBoxName.Text + "' and DOB='" + TextBoxDOB.Text + "' and Phone1='" + TextBoxPhone1.Text + "'", con);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        Session["PatientIdForAddingToVisitList"] = dt.Rows[0][0].ToString();
                        Response.Redirect("~/ManageVisits.aspx");
                    }
                }
                //catch (Exception ex)
                //{

                //    Session["Exception"] = ex;Response.Redirect("~/404.aspx");
                //}                                
            }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "Invalid City/Category Selection !";
            }
        }

    }

}