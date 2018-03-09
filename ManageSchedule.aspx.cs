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
    public partial class UpdateSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButtonSelect_Click(object sender, EventArgs e)
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "update Affiliations set MondayFrom='" + ChangeTimeFormat(tbmonfrom.Text) + "' ,MondayTo='" + ChangeTimeFormat(tbmonto.Text) + "' ,TuesdayFrom='" + ChangeTimeFormat(tbtuefrom.Text) + "' ,TuesdayTo='" + ChangeTimeFormat(tbtueto.Text) + "' ,WednesdayFrom='" + ChangeTimeFormat(tbwedfrom.Text) + "' ,WednesdayTo='" + ChangeTimeFormat(tbwedto.Text) + "' ,ThursdayFrom='" + ChangeTimeFormat(tbthufrom.Text) + "' ,ThursdayTo='" + ChangeTimeFormat(tbthuto.Text) + "' ,FridayFrom='" + ChangeTimeFormat(tbfrifrom.Text) + "' ,FridayTo='" + ChangeTimeFormat(tbfrito.Text) + "' ,SaturdayFrom='" + ChangeTimeFormat(tbsatfrom.Text) + "' ,SaturdayTo='" + ChangeTimeFormat(tbsatto.Text) + "' ,SundayFrom='" + ChangeTimeFormat(tbsunfrom.Text) + "' ,SundayTo='" + ChangeTimeFormat(tbsunto.Text) + "'";

                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Redirect("~/ManageAffiliations.aspx");

                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
           
        }
        protected string ChangeTimeFormat(string timeunformatted)
        {
            string timeformated = DateTime.Parse(timeunformatted, System.Globalization.CultureInfo.CurrentCulture).ToString("HH:mm:ss tt");
            return timeformated;
        }
    }
}