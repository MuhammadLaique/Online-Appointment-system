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
    public partial class ManageVisits : System.Web.UI.Page
    {
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            string previousPageName = System.IO.Path.GetFileName(Request.UrlReferrer.AbsolutePath);
            tbName.Disabled = true;
            if (Request.UrlReferrer != null)
            {
                //string previousPageUrl = Request.UrlReferrer.AbsoluteUri;
                if (previousPageName == "ManageAppointmentRequests.aspx" || previousPageName=="PatientProfileBuilderPage.aspx")
                {
                    ButtonAddExternal.Visible = false;
                    try
                    {
                        string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(CS))
                        {
                            string query = "select Name from PatientProfile where PatientId='" + Session["PatientIdForAddingToVisitList"] + "'";
                            SqlDataAdapter da = new SqlDataAdapter(query, con);
                            DataTable dt1 = new DataTable();
                            da.Fill(dt1);
                            tbName.Value = dt1.Rows[0][0].ToString();
                        }
                    }
                    catch (Exception ex)
                    {

                        Session["Exception"] = ex;Response.Redirect("~/404.aspx");
                    }
                    
                }
            }
            getdata();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
                   
                        
        protected void getdata()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string sql = "SELECT Visits.VisitId,PatientProfile.Name as Patient,Visits.MainIssue,Visits.StartDate,Visits.EndDate,Visits.Symptoms,Visits.Status,Visits.Description FROM Visits INNER JOIN PatientProfile ON Visits.PatientID = PatientProfile.PatientId where Visits.DoctorID='" + Session["DoctorId"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(sql, con);
                    dt = new DataTable();
                    da.Fill(dt);
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
         
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(tbName.Value != "")
            {
                if (tbIssue.Value != "" && taDescription.Value != "" && taSymptoms.Value != "")
                {
                    try
                    {
                        String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(CS))
                        {
                            SqlCommand cmd = new SqlCommand("insert into Visits (DoctorId,PatientId,MainIssue,StartDate,EndDate,Status,Description,Symptoms) values('" + Session["DoctorId"] + "','" + Session["PatientIdForAddingToVisitList"] + "','" + tbIssue.Value + "','" + DateTime.Today.ToString("dd-MM-yyyy") + "','','UnCleared','" + taDescription.Value + "','" + taSymptoms.Value + "')", con);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            ButtonAddExternal.Visible = true;
                        }
                    }
                    catch (Exception ex)
                    {

                        Session["Exception"] = ex;Response.Redirect("~/404.aspx");
                    }
                    
                }
                else
                {
                    lblMsg.ForeColor = Color.Red;
                    lblMsg.Text = "Fields are Mandatory";

                }
            }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "If Patient is not in the Request list Add Patient Externally";
            }
            
        }
        protected void ButtonAddExternal_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PatientProfileBuilderPage.aspx");
        }

        protected void FireRowCommand(object sender, GridViewCommandEventArgs e)

        {

            string command = e.CommandName;

            string visitId = e.CommandArgument.ToString();
            Session["VisitId"] = visitId;

            switch (command)

            {

                case "ManageTestReports":
                    {                      
                        Response.Redirect("~/ManageTestReports.aspx");                        
                        break;
                    }

                case "ManagePrescriptions":
                    {
                        Response.Redirect("~/ManagePrescriptions.aspx");                        
                        break;
                    }
                case "ManageProblems":
                    {
                        Response.Redirect("~/ManageProblems.aspx");                       
                        break;
                    }
            }
        }
    }
}