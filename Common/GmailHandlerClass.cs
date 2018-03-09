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

namespace SignalRChat.Common
{
    public class GmailHandlerClass
    {
        public string SendEmail(string recipient, string subject, string body)
        {
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                mail.From = new MailAddress("zawwarkhan316@gmail.com");
                mail.To.Add(recipient);
                mail.Subject = subject;
                mail.Body = body;

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential("zawwarkhan316@gmail.com", "code13354");
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);
                return "Email Sent";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }
    }
}