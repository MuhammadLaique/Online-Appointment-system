using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Net.Mail;
using SignalRChat.Common;

namespace SignalRChat
{
    public partial class DoctorSignUpRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btSignup_Click(object sender, EventArgs e)
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into DoctorRegistrationRequestsTable (Name,Email,Phone,Message) values('" + TextBoxName.Text + "','" + TextBoxEmail.Text + "','" + TextBoxPhone.Text + "','" + taMessage.Value + "')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    SendEmailToWait();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('" + Response + "');</script>");
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
                


            
            
        }

        private void SendEmailToWait()
        {
            string recipient = TextBoxEmail.Text;
            string subject = "Patient Portal Verification and SinUp Completion";
            string body = "Our team will soon contact you. Wait For our next mail.";
            GmailHandlerClass obj = new GmailHandlerClass();
            obj.SendEmail(recipient, subject, body);
            string response = obj.SendEmail(recipient, subject, body);
        }
    }
}