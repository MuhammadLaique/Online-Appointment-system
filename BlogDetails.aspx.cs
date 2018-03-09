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
    public partial class BlogDetails : System.Web.UI.Page
    {
        public string name, specialization, phone, email, blogid, topic, category, message, date, time = null;       
        protected void Page_Load(object sender, EventArgs e)
        {
            GetBlogData();
            GetDoctorOtherBlogsdata();
            GetSimilarBlogdata();
        }

        public void GetBlogData()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "Select DoctorProfile.Name,DoctorProfile.Specialization,DoctorProfile.Phone1,DoctorProfile.EmailP,Blogs.* from DoctorProfile inner join Blogs on DoctorProfile.DoctorId=Blogs.WriterId where Blogs.BlogId='" + Session["SelectedBlogForDetailView"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    name = dt.Rows[0][0].ToString();
                    specialization = dt.Rows[0][1].ToString();
                    phone = dt.Rows[0][2].ToString();
                    email = dt.Rows[0][3].ToString();
                    blogid = dt.Rows[0][4].ToString();
                    topic = dt.Rows[0][6].ToString();
                    category = dt.Rows[0][7].ToString();
                    message = dt.Rows[0][8].ToString();
                    date = dt.Rows[0][9].ToString();
                    time = dt.Rows[0][10].ToString();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
        }

        protected void GetDoctorOtherBlogsdata()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "select top 5 Blogs.*,DoctorProfile.Name from Blogs inner join DoctorProfile on Blogs.WriterId=DoctorProfile.DoctorId where Blogs.Blogid!='" + Session["SelectedBlogForDetailView"] + "' and Blogs.WriterId=(select WriterId from Blogs where BlogId='" + Session["SelectedBlogForDetailView"] + "' )";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    GridViewDoctorOtherBlogs.DataSource = ds;
                    GridViewDoctorOtherBlogs.DataBind();

                }
            }
            catch (Exception ex)
            {
                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
           
        }
        protected void GetSimilarBlogdata()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "select top 5 Blogs.*,DoctorProfile.Name from Blogs inner join DoctorProfile on Blogs.WriterId=DoctorProfile.DoctorId where Blogs.Blogid!='" + Session["SelectedBlogForDetailView"] + "' and Blogs.Category=(select Category from Blogs where BlogId='" + Session["SelectedBlogForDetailView"] + "' )";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    GridViewSimilarBlogs.DataSource = ds;
                    GridViewSimilarBlogs.DataBind();

                }
            }
            catch (Exception ex)
            {
                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
        }

        protected void FireRowCommandDoctorOtherBlogs(object sender, GridViewCommandEventArgs e)

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

        protected void FireRowCommandSimilarBlogs(object sender, GridViewCommandEventArgs e)

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