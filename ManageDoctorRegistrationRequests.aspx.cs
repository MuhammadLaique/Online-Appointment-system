using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SignalRChat.Common;

namespace SignalRChat
{
    public partial class ViewDoctorRegistrationRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();            
        }
        private void BindData()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlDataAdapter da = new SqlDataAdapter("Select * from DoctorRegistrationRequestsTable", con);
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
            int requestId = Int32.Parse(e.CommandArgument.ToString());            
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
                                SqlCommand com = new SqlCommand("Select * from DoctorRegistrationRequestsTable where RequestId='" + requestId + "'", connection);
                                using (SqlDataReader reader = com.ExecuteReader())
                                {
                                    if (reader.Read())
                                    {

                                        string name = reader.GetString(1);
                                        string email = reader.GetString(2);
                                        GmailHandlerClass obj = new GmailHandlerClass();
                                        string result = obj.SendEmail(email, "Patient Portal Verification and SinUp Completion", "DEAR" + name + "follow the link");
                                        Response.Write(result);
                                        ChangeRespondstatus(requestId);
                                        BindData();
                                    }
                                }
                                connection.Close();
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

        protected void ChangeRespondstatus(int RequestId)
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(CS))
                {
                    connection.Open();
                    SqlCommand com = new SqlCommand("update DoctorRegistrationRequestsTable set Responded='Yes' where RequestId='" + RequestId + "'", connection);
                    com.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
        }

    }
}