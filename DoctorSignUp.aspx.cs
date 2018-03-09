using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SignalRChat
{
    public partial class DoctorSignUp : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btSignup_Click(object sender, EventArgs e)
        {
            //Inserting new values

            if (tbUname.Text.Contains("_"))
            {
                if (VerifyUsernameValidity() == true)
                {
                    if (tbPass.Text == tbCPass.Text)
                    {
                       // try
                        {
                            String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                            using (SqlConnection con = new SqlConnection(CS))
                            {
                                SqlCommand cmd = new SqlCommand("insert into UserAccounts(UserName,Password,UserType,LoginStatus) values('" + tbUname.Text + "','" + tbPass.Text + "','Doctor','Offline')", con);
                                con.Open();
                                cmd.ExecuteNonQuery();
                                CreateUserMailTables();
                                StoreUserIdToSession();
                                Session["UserName"] = tbUname.Text;
                                string imgPath = @"~/Images/Doctors/" + tbUname.Text + ".jpg";
                                if (FileUploader.HasFile)
                                {
                                    FileUploader.SaveAs(Server.MapPath(imgPath));
                                }
                                else
                                {
                                    File.Copy(Server.MapPath("~/Images/noimage.jpg"), Server.MapPath(imgPath));
                                }

                                Response.Redirect("~/DoctorProfileBuilderPage.aspx");
                            }
                        }
                        //catch (Exception ex)
                        //{

                        //    Session["Exception"] = ex;
                        //    Response.Redirect("~/404.aspx");
                        //}
                        
                    }
                    else
                    {
                        lblMsg.ForeColor = Color.Red;
                        lblMsg.Text = "Passwords do not match";
                    }
                }
                else
                {
                    lblMsg.ForeColor = Color.Red;
                    lblMsg.Text = "Username already exist";
                }

            }
            else
            {

                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "Use _ (Underscore), digits (0-9)and alphabets to generate your Username";
            }

        }


        

        protected bool VerifyUsernameValidity()
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select UserName from UserAccounts where UserName='" + tbUname.Text + "'", con);
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count == 0)
                    {
                        return true;
                    }
                    return false;
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
                return false;
            
        }

        protected void CreateUserMailTables()
        {
            try
            {
                string nameforinbox = tbUname.Text + "inbox";
                string nameforsentbox = tbUname.Text + "sentbox";
                string CS = ConfigurationManager.ConnectionStrings["ConnectToMailEngine"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string statement = "CREATE TABLE " + nameforinbox + " (MessageId int IDENTITY(1,1) NOT NULL,Sender varchar(50),Message varchar(255),Date varchar(55),Time varchar(55))";
                    SqlCommand cmd = new SqlCommand(statement, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    statement = "CREATE TABLE " + nameforsentbox + " (MessageId int IDENTITY(1,1) NOT NULL,Recipient varchar(50),Message varchar(255),Date varchar(55),Time varchar(55))";
                    cmd = new SqlCommand(statement, con);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
           
        }
        private void StoreUserIdToSession()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(CS))
                {
                    connection.Open();
                    SqlCommand com = new SqlCommand("Select UserId from UserAccounts where UserName='" + tbUname.Text + "'", connection);
                    using (SqlDataReader reader = com.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Session["UserId"] = reader.GetInt32(0);
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