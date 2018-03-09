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
    public partial class WebFormserch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                populatecitylist();

            }
        }
        protected void populatecitylist()
        {
            String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select CityName from Cities", con);
                con.Open();
                ddlcity.DataSource = cmd.ExecuteReader();
                ddlcity.DataTextField = "CityName";
                ddlcity.DataValueField = "CityName";
                ddlcity.DataBind();
                ddlcity.Items.Insert(0, new ListItem("All", "All"));
                //cmd = new SqlCommand("select CategoryName from Categories", con);
                //ddlcategory.DataSource = cmd.ExecuteReader();
                //ddlcategory.DataTextField = "CategoryName";
                //ddlcategory.DataValueField = "CategoryName";
                //ddlcategory.DataBind();
                //ddlcategory.Items.Insert(0, new ListItem("Select Category", "Select Category"));
                //ddlcategory.Items.Add(new ListItem("Other", "Other"));
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            if (ddlsearchfor.Value == "Hospital")
            {
                SearchForHospital();
            }
            else if (ddlsearchfor.Value == "Doctor")
            {

            }



        }


        protected void SearchForHospital()
        {
            string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                string query = "Select * from Institutes";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DataView dv = new DataView(dt);
                if (ddlcity.SelectedValue != "All")
                {
                    dv.RowFilter = "City='" + ddlcity.SelectedValue + "'";
                }
                dt = dv.ToTable();
                GridViewHospital.DataSource = dt;
                GridViewHospital.DataBind();
            }

        }

    }
}