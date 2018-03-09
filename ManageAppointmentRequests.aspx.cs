using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SignalRChat
{
    public partial class ViewPatientAppointmentRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           GetData();

            
        }
        private void GetData()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string sql = "SELECT Appointments.AppointmentId,PatientProfile.Name as Patient,PatientProfile.Phone1 as Phone,PatientProfile.City,Appointments.Date,Appointments.Time,Appointments.Message,Appointments.Responded FROM Appointments INNER JOIN PatientProfile ON Appointments.PatientId = PatientProfile.PatientId where Appointments.DoctorId='" + Session["DoctorId"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(sql, con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
           
        }
        protected void FireRowCommand(object sender, GridViewCommandEventArgs e)

        {
            string command = e.CommandName;
            string appointmentId = e.CommandArgument.ToString();
            switch (command)
            {
                case "Respond":
                    {
                        try
                        {
                            string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                            using (SqlConnection connection = new SqlConnection(CS))
                            {
                                connection.Open();
                                SqlDataAdapter da = new SqlDataAdapter("Select UserName from UserAccounts where UserId=(Select UserId from PatientProfile where PatientId=(select PatientId from Appointments where AppointmentId='" + appointmentId + "'))", connection);
                                DataTable dt = new DataTable();
                                da.Fill(dt);
                                Session["UserNameOfAppointmentRequestSender"] = dt.Rows[0][0].ToString();
                                SqlCommand cmd = new SqlCommand("update Appointments set Responded='Yes' where AppointmentId='" + appointmentId + "'", connection);
                                cmd.ExecuteNonQuery();
                                Response.Redirect("~/MailPage.aspx");
                            }
                            
                        }
                        catch (Exception ex)
                        {

                            Session["Exception"] = ex;
                            Response.Redirect("~/404.aspx");
                        }
                        break;
                    }

                case "Chat":
                    {
                        Response.Redirect("~/ChatPage.aspx");
                        //string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                        //using (SqlConnection con = new SqlConnection(CS))
                        //{
                        //    SqlDataAdapter da = new SqlDataAdapter("Select * from Appointments where AppointmentId='" + appointmentId + "'", con);
                        //    DataSet ds = new DataSet();
                        //    da.Fill(ds);
                        //    DataTable dt = ds.Tables[0];


                        //}
                        break;
                    }
                case "Add":
                    {
                        try
                        {
                            string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                            using (SqlConnection con = new SqlConnection(CS))
                            {
                                SqlDataAdapter da = new SqlDataAdapter("Select PatientId from Appointments where AppointmentId='" + appointmentId + "'", con);
                                DataTable dt = new DataTable();
                                da.Fill(dt);
                                Session["PatientIdForAddingToVisitList"] = dt.Rows[0][0].ToString();
                                Response.Redirect("~/ManageVisits.aspx");


                            }
                        }
                        catch (Exception ex)
                        {
                            Session["Exception"] = ex;
                            Response.Redirect("~/404.aspx");
                        }
                        
                        break;
                    }

                case "Del":
                    {
                        try
                        {
                            string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                            using (SqlConnection con = new SqlConnection(CS))
                            {
                                SqlDataAdapter da = new SqlDataAdapter("delete from Appointments where AppointmentId='" + appointmentId + "'", con);
                                DataTable dt = new DataTable();
                                da.Fill(dt);
                                GetData();
                            }
                        }
                        catch (Exception ex)
                        {

                            Session["Exception"] = ex;
                            Response.Redirect("~/404.aspx");
                        }
                        
                        break;
                    }



            }
        }
        }
}