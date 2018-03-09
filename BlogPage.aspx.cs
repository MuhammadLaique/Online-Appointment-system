using System;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace SignalRChat
{
    public partial class BlogPage2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DoctorId"] != null)
            {
                btnWrite.Visible = true;
            }
            else
            {
                btnWrite.Visible = false;
            }
            getdata();
        }

        protected void getdata()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "select Blogs.*,DoctorProfile.Name from Blogs inner join DoctorProfile on Blogs.WriterId=DoctorProfile.DoctorId";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();

                }
            }
            catch (Exception ex)
            {
                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
        }


        protected void btnWrite_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WriteBlog.aspx");
        }

        protected void FireRowCommand(object sender, GridViewCommandEventArgs e)

        {
            string command = e.CommandName;
            string BlogId = e.CommandArgument.ToString();
            switch (command)
            {
                case "ViewDetails":
                    {
                        Session["SelectedBlogForDetailView"] = BlogId;
                        Response.Redirect("~/BlogDetails.aspx");
                        break;
                    }

            }
        }

    }
}