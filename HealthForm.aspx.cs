using System;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace SignalRChat
{
    public partial class HealthForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                GridView1.DataSource = GetData("select * from ForumQuestions");
                GridView1.DataBind();
            }
        }

       

        private DataTable GetData(string query)
        {
            try
            {
                string strConnString = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(strConnString))
                {
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            return null;
        }

        protected void OnRowDataBoundQ(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string customerId = GridView1.DataKeys[e.Row.RowIndex].Value.ToString();
                GridView gvOrders = e.Row.FindControl("gvOrders") as GridView;
                gvOrders.DataSource = GetData(string.Format("select * from ForumAnswers where QuestionId='{0}'", customerId));
                gvOrders.DataBind();
               
            }
        }

        
        protected void submitquestion(object sender, EventArgs e)
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into ForumQuestions(UserName,Question,Date,Time) values('" + Session["UserName"] + "','" + taquestion.Value + "','" + DateTime.Today.ToString("dd-MM-yyyy") + "','" + DateTime.Now.ToString("HH:mm:ss tt") + "')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    taquestion.Value = null;
                    GridView1.DataSource = GetData("select * from ForumQuestions");
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
            string questionid = e.CommandArgument.ToString();
            int a = Int32.Parse(questionid);
            TextBox tbanswer = (TextBox)GridView1.Rows[a-1].FindControl("tbanswer");   //a-1 because questionid in database starts with 1          
            switch (command)

            {

                case "answer":
                    {
                        try
                        {
                            String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                            using (SqlConnection con = new SqlConnection(CS))
                            {
                                SqlCommand cmd = new SqlCommand("insert into ForumAnswers(QuestionId,UserName,Answer,Date,Time) values('" + a + "','" + Session["UserName"] + "', '" + tbanswer.Text + "','" + DateTime.Today.ToString("dd-MM-yyyy") + "','" + DateTime.Now.ToString("HH:mm:ss tt") + "')", con);
                                con.Open();
                                cmd.ExecuteNonQuery();
                                taquestion.Value = null;
                                GridView1.DataSource = GetData("select * from ForumQuestions");
                                GridView1.DataBind();
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

    }
}