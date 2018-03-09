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
    public partial class Suggestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Username"]!=null)
            {
                tbPhone.Text = GetPhoneNoOfReporter();
            }
        }

        protected string GetPhoneNoOfReporter()
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = null;
                    if (Session["UserType"].ToString() == "Doctor")
                    {
                        query = "select Phone1 from DoctorProfile where UserId=(select UserId from UserAccounts where UserName='" + Session["Username"] + "')";
                    }
                    else if (Session["UserType"].ToString() == "Patient")
                    {
                        query = "select Phone1 from PatientProfile where UserId=(select UserId from UserAccounts where UserName='" + Session["Username"] + "')";
                    }
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt.Rows[0][0].ToString();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
            return null;
        }

        protected string GetSuggestionList()
        {
            string suggestionList = "start";
            if(time.Checked==true)
            {
                suggestionList += ",time";
            }
            if (Fee.Checked == true)
            {
                suggestionList += ",fee";
            }

            if (ContactInfo.Checked == true)
            {
                suggestionList += ",contactInfo";
            }

            if (Education.Checked == true)
            {
                suggestionList += ",education";
            }

            if (Experience.Checked == true)
            {
                suggestionList += ",experience";
            }

            if (Address.Checked == true)
            {
                suggestionList += ",address";
            }
            return suggestionList;
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string Suggestions = GetSuggestionList();
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = null;
                    // if (Session["Username"] != null)
                    {
                        query = "insert into EditSuggestions(ById,ForId,Phone,Suggestion,Comment) values('" + Session["UserId"] + "','" + Session["SelectedDoctorForDetailView"] + "','" + tbPhone.Text + "','" + Suggestions + "','" + tamessage.Value + "' )";
                    }
                    // if (Session["Username"] == null)
                    {
                        // query = "insert into Suggestions(UserId,Phone,Suggestion,Comment) values('" + Session["UserId"] + "','" + tbPhone.Text + "','" + Suggestions + "','" + tamessage.Value + "' )";
                    }
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
            

        }
    }
}