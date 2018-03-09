using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SignalRChat
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtAdminLogout_Click(object sender, EventArgs e)
        {
            ChangeLoginStatus();
            Session["UserName"] = null;
            Response.Redirect("~/LandingPage.aspx");
        }

        private void ChangeLoginStatus()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(CS))
                {
                    connection.Open();
                    SqlCommand com = new SqlCommand("update UserAccounts set LoginStatus='LogOff' where UserId='" + Session["UserId"] + "'", connection);
                    using (SqlDataReader reader = com.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Session["DoctorId"] = reader.GetInt32(0);
                            Session["Name"] = reader.GetString(1);
                        }
                    }
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