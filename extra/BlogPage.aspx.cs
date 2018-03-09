using System;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace SignalRChat
{
    public partial class BlogPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getdata();
        }

        protected void getdata()
        {
            string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlDataAdapter da = new SqlDataAdapter("Select * from Blogs", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DataTable doctor = ds.Tables[0];
                DataView dv = new DataView(doctor);
                //if (SelectCityList.Value != "All")
                //{
                //    dv.RowFilter = "City='" + SelectCityList.Value + "'";
                //}
                //if (SelectProblem.Value!="All")
                //{
                //    dv.RowFilter = "Specialization='" + SelectProblem.Value + "'";
                //}
                //if (SelectGender.Value != "Both")
                //{
                //    dv.RowFilter = "Specialization='" + SelectGender.Value + "'";
                //}

                //dv.RowFilter = "FeeMin >= '"+SelectFeeMin+ "' AND FeeMin >= '" + SelectFeeMax + "'";

                doctor = dv.ToTable();
                DataSet ds2 = new DataSet(); ds2.Tables.Add(doctor);
                //Session["set"] = ds2;
                //Response.Redirect("~/GeneratedList.aspx");
                GridView1.DataSource = ds;
                GridView1.DataBind();

            }

        }

    }

}