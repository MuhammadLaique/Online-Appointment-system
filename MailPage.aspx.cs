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
    public partial class MailPage : System.Web.UI.Page
    {
        
    public string nameforrecipientinbox = null;
        public string nameforsendersentbox = null;
        public string nameforsenderinbox = null;
        private DataTable dt1, dt2;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.UrlReferrer != null)
            {
                string previousPageName = System.IO.Path.GetFileName(Request.UrlReferrer.AbsolutePath);
                if (previousPageName=="ManageAppointmentRequests.aspx")
                {
                    Recipient.Text = Session["UserNameOfAppointmentRequestSender"].ToString();
                }
                if (previousPageName == "DoctorHome.aspx")
                {
                    Recipient.Text = Session["Recipient"].ToString();
                }
            }
            nameforsendersentbox = Session["Username"].ToString() + "sentbox";
            nameforsenderinbox = Session["Username"].ToString() + "inbox";
            getdata();
            GridView1.DataSource = dt1;
            GridView1.DataBind();
            PopulateUsernameList();
        }

        protected void PopulateUsernameList()
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select UserName from UserAccounts", con);
                    con.Open();
                    ddlusername.DataSource = cmd.ExecuteReader();
                    ddlusername.DataTextField = "UserName";
                    ddlusername.DataValueField = "UserName";
                    ddlusername.DataBind();
                    ddlusername.Items.Insert(0, new ListItem("Select UserName", "Select UserName"));
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }      
            
                
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Recipient.Text != "")
            {
                if (checkusername() == true)
                {
                    sendmail();
                }
                else
                {
                    lblMsg.ForeColor = Color.Red;
                    lblMsg.Text = "Invalid Recipient";
                }
            }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "Enter Recipient";

            }
        }
        protected bool checkusername()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlDataAdapter da = new SqlDataAdapter("Select UserName from UserAccounts where Username='" + Recipient.Text + "'", con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        nameforrecipientinbox = Recipient.Text + "inbox";
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
        protected void sendmail()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToMailEngine"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "insert into " + nameforrecipientinbox + "(Sender,Message ,Date,Time) values('" + Recipient.Text + "','" + message.Value + "','" + DateTime.Today.ToString("dd-MM-yyyy") + "','" + DateTime.Now.ToString("HH:mm:ss tt") + "')";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    query = "insert into " + nameforsendersentbox + "(Recipient,Message ,Date,Time) values('" + Recipient.Text + "','" + message.Value + "','" + DateTime.Today.ToString("dd-MM-yyyy") + "','" + DateTime.Now.ToString("HH:mm:ss tt") + "')";
                    cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
        }

        protected void InBoxToggleButton_Click(object sender, EventArgs e)
        {
                GridView1.DataSource = dt1;
                GridView1.DataBind();
        }
        protected void SentBoxToggleButton_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = dt2;
            GridView1.DataBind();
        }

        protected void getdata()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToMailEngine"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "select * from " + nameforsenderinbox;
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    dt1 = new DataTable();
                    da.Fill(dt1);
                    query = "select * from " + nameforsendersentbox;
                    da = new SqlDataAdapter(query, con);
                    dt2 = new DataTable();
                    da.Fill(dt2);
                }
            }
            catch (Exception ex)
            {
                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
        }

        protected void ddlusername_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlusername.SelectedValue!="Select UserName")
            {
                Recipient.Text = ddlusername.SelectedValue;
            }
            
        }

        protected void FireRowCommand(object sender, GridViewCommandEventArgs e)

        {

            string command = e.CommandName;
            string messageid = e.CommandArgument.ToString();
            switch (command)

            {

                case "Reply":
                    {
                        if(GridView1.DataSource==dt1)
                        {
                            try
                            {
                                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                                using (SqlConnection con = new SqlConnection(CS))
                                {
                                    string query = "Select Sender,Message from " + nameforsenderinbox + "where MessageId='" + messageid + "'";
                                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                                    DataTable dt = new DataTable();
                                    da.Fill(dt);
                                    Recipient.Text = dt.Rows[0][0].ToString();
                                }
                            }
                            catch (Exception ex)
                            {

                                Session["Exception"] = ex;
                                Response.Redirect("~/404.aspx");
                            }
                            
                        }                        
                        break;
                    }

                case "Del":
                    {
                        if (GridView1.DataSource == dt1)
                        {
                            try
                            {
                                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                                using (SqlConnection con = new SqlConnection(CS))
                                {
                                    string query = "delete from " + nameforsenderinbox + "where MessageId='" + messageid + "'";
                                    SqlCommand cmd = new SqlCommand(query, con);
                                    con.Open();
                                    cmd.ExecuteNonQuery();
                                }
                            }
                            catch (Exception ex)
                            {
                                Session["Exception"] = ex;
                                Response.Redirect("~/404.aspx");
                            }
                            
                        }
                        else if (GridView1.DataSource == dt2)
                        {
                            try
                            {
                                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                                using (SqlConnection con = new SqlConnection(CS))
                                {
                                    string query = "delete from " + nameforsendersentbox + "where MessageId='" + messageid + "'";
                                    SqlCommand cmd = new SqlCommand(query, con);
                                    con.Open();
                                    cmd.ExecuteNonQuery();
                                }
                            }
                            catch (Exception ex)
                            {

                                Session["Exception"] = ex;
                                Response.Redirect("~/404.aspx");
                            }
                            
                        }
                        break;
                    }
                case "Forward":
                    {
                        if (GridView1.DataSource == dt1)
                        {
                            try
                            {
                                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                                using (SqlConnection con = new SqlConnection(CS))
                                {
                                    string query = "Select Message from " + nameforsenderinbox + "where MessageId='" + messageid + "'";
                                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                                    DataTable dt = new DataTable();
                                    da.Fill(dt);
                                    message.Value = dt.Rows[0][0].ToString();
                                }
                            }
                            catch (Exception ex)
                            {
                                Session["Exception"] = ex;
                                Response.Redirect("~/404.aspx");
                            }
                            
                        }
                        else if(GridView1.DataSource == dt2)
                        {
                            try
                            {
                                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                                using (SqlConnection con = new SqlConnection(CS))
                                {
                                    string query = "Select Message from " + nameforsendersentbox + "where MessageId='" + messageid + "'";
                                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                                    DataTable dt = new DataTable();
                                    da.Fill(dt);
                                    message.Value = dt.Rows[0][0].ToString();
                                }
                            }
                            catch (Exception ex)
                            {
                                Session["Exception"] = ex;
                                Response.Redirect("~/404.aspx");
                            }
                            
                        }

                        break;
                    }





            }
        }


    }
}