using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace SignalRChat
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["UNAME"] != null && Request.Cookies["PWD"] != null)
                {
                    UserName.Text = Request.Cookies["UNAME"].Value;
                    Password.Attributes["value"] = Request.Cookies["PWD"].Value;
                    CheckBox1.Checked = true;
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
           // try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select * from UserAccounts where Username='" + UserName.Text + "' and Password='" + Password.Text + "'", con);
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    if (dt.Rows.Count != 0)
                    {
                        if (CheckBox1.Checked)
                        {
                            Response.Cookies["UNAME"].Value = UserName.Text;
                            Response.Cookies["PWD"].Value = Password.Text;

                            Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(15);
                            Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(15);
                        }
                        else
                        {
                            Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(-1);
                        }
                        Session["UserId"] = dt.Rows[0][0].ToString();
                        Session["UserName"] = UserName.Text;
                        ChangeLoginStatus();
                        string Utype;
                        Utype = dt.Rows[0][3].ToString();
                        if (Utype == "Doctor")
                        {
                            Session["UserType"] = "Doctor";
                            StoreDoctorIdToSession();
                            if (CheckIfDoctorProfileIsFirstTimeUpdated())
                            {
                                Response.Redirect("~/DoctorHome.aspx");
                            }
                            else
                            {
                                Response.Redirect("~/DoctorProfileBuilderPage.aspx");
                            }

                        }
                        if (Utype == "Admin")
                        {
                            Session["UserType"] = "Admin";
                            Response.Redirect("~/AdminHome.aspx");
                        }
                        if (Utype == "Patient")

                        {
                            Session["UserType"] = "Patient";
                            StorePatientIdToSession();
                            if (CheckIfPatientProfileIsFirstTimeUpdated())
                            {
                                Response.Redirect("~/PatientHome.aspx");
                            }
                            else
                            {
                                Response.Redirect("~/PatientProfileBuilderPage.aspx");
                            }
                        }

                    }
                    else
                    {
                        lblError.Text = "Invalid Username or Password !";
                        //Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "document.getElementById('ii').innerHTML = 'asasasasa'", true);
                        Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "$('#InformationModal').modal();", true);
                    }
                }
            }
            //catch (Exception ex)
            //{

            //    Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            //}
               
            
            
        }
        private void StoreDoctorIdToSession()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(CS))
                {
                    connection.Open();
                    SqlCommand com = new SqlCommand("Select DoctorId,Name from DoctorProfile where UserId='" + Session["UserId"] + "'", connection);
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

        private void StorePatientIdToSession()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(CS))
                {
                    connection.Open();
                    SqlCommand com = new SqlCommand("Select PatientId,Name from PatientProfile where UserId='" + Session["UserId"] + "'", connection);
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

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
            

        }

        private void ChangeLoginStatus()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(CS))
                {
                    connection.Open();
                    SqlCommand com = new SqlCommand("update UserAccounts set LoginStatus='Login' where UserId='" + Session["UserId"] + "'", connection);
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

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
            

        }

        private bool CheckIfDoctorProfileIsFirstTimeUpdated()
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select UserId from DoctorProfile where UserId='" + Session["UserId"] + "'", con);
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        return true;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
            return false;
        }
        private bool CheckIfPatientProfileIsFirstTimeUpdated()
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select UserId from PatientProfile where UserId='" + Session["UserId"] + "'", con);
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        return true;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
            return false;
        }
    }
}