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
    public partial class PatientVisits : System.Web.UI.Page
    {
        private DataTable dt1;
        protected void Page_Load(object sender, EventArgs e)
        {
            getdata();
            GridView1.DataSource = dt1;
            GridView1.DataBind();
        }
        protected void getdata()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string sql = "SELECT Visits.VisitId,DoctorProfile.Name as Doctor Visits.MainIssue,Visits.StartDate,Visits.EndDate,Visits.Symptoms,Visits.Status,Visits.Description FROM Visits INNER JOIN DoctorProfile ON Visits.DoctorID = DoctorProfile.DoctorId where Visits.PatientID='" + Session["PatientId"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(sql, con);
                    dt1 = new DataTable();
                    da.Fill(dt1);
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
            

        }

        protected void FireRowCommand(object sender, GridViewCommandEventArgs e)

        {

            string command = e.CommandName;

            string visitId = e.CommandArgument.ToString();
            Session["VisitId"] = visitId;

            switch (command)

            {

                case "ViewTestReports":
                    {



                        Response.Redirect("~/PatientTestReports.aspx");

                        break;
                    }

                case "ViewPrescriptions":
                    {
                        Response.Redirect("~/PatientPrescriptions.aspx");

                        break;
                    }
                case "ViewProblems":
                    {
                        Response.Redirect("~/PatientProblems.aspx");

                        break;
                    }





            }
        }

    }
}