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
    public partial class ManageProblems : System.Web.UI.Page
    {       
        protected void Page_Load(object sender, EventArgs e)
        {
            getdata();
            
        }
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into Problems(VisitId,ProblemType,Severity,StartDate,EndDate,Notes) values('" + Session["VisitID"] + "','" + tbProblemType.Text + "','" + tbSeverity.Text + "','" + DateTime.Today.ToString("dd-MM-yyyy") + "','','" + taNotes.Value.ToString() + "')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    getdata();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
            
        }
        protected void getdata()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string sql = "SELECT ProblemId,ProblemType,Severity,StartDate,EndDate,Notes FROM Problems where VisitId='" + Session["VisitID"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(sql, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
            
        }

        protected void FireRowCommand(object sender, GridViewCommandEventArgs e)

        {
            string command = e.CommandName;
            string ProblemId = e.CommandArgument.ToString();
            switch (command)
            {
                case "MarkAsEnded":
                    {
                        try
                        {
                            string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                            using (SqlConnection con = new SqlConnection(CS))
                            {
                                SqlDataAdapter da = new SqlDataAdapter("update Problems set EndDate='" + DateTime.Today.ToString("dd-MM-yyyy") + "' where PoblemId='" + ProblemId + "'", con);
                                DataTable dt = new DataTable();
                                da.Fill(dt);
                                getdata();
                            }
                        }
                        catch (Exception ex)
                        {

                            Session["Exception"] = ex;Response.Redirect("~/404.aspx");
                        }
                       
                        break;
                    }



            }
        }

    }
}