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
    public partial class WriteBlog : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (tbtopic.Text != "" && tbcategory.Text != "" && tacontent.Value != "")
            {
                try
                {
                    String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {

                        SqlCommand cmd = new SqlCommand("insert into Blogs(WriterId,Topic,Category,Message,Date,Time) values('" + Session["DoctorId"] + "','" + tbtopic.Text + "','" + tbcategory.Text + "','" + tacontent.Value + "','" + DateTime.Today.ToString("dd-MM-yyyy") + "','" + DateTime.Now.ToString("HH:mm:ss tt") + "')", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        cmd = new SqlCommand("select BlogId from Blogs where WriterId='" + Session["DoctorId"] + "' and Topic='" + tbtopic.Text + "' and Category='" + tbcategory.Text + "' and Message='" + tacontent.Value + "'", con);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        string blogid = dt.Rows[0][0].ToString();
                        string imgPath = @"~/Images/Blogs/" + blogid + ".jpg";
                        if (FileUploader.HasFile)
                        {
                            FileUploader.SaveAs(Server.MapPath(imgPath));
                        }
                        else
                        {
                            File.Copy(Server.MapPath("~/Images/noimage.jpg"), Server.MapPath(imgPath));
                        }
                        //FileUploader.SaveAs(Server.MapPath(tempimgPath));

                        //Response.Redirect("~/DoctorProfileBuilderPage.aspx");
                    }
                }
                catch (Exception ex)
                {

                    Session["Exception"] = ex;Response.Redirect("~/404.aspx");
                }
                
            }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "All Fields Are Mandatory!";
            }
        }

        
    }
}
    
