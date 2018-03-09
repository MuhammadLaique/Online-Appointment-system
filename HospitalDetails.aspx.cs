using System;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace SignalRChat
{
    public partial class HospitalDetails : System.Web.UI.Page
    {
        public string name, type, city, address = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            GetHospitalData();
            GetDoctorsOnBoard();
        }

        protected void GetHospitalData()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "Select * from Institutes where InstituteId='" + Session["SelectedHospitalForDetailView"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    name = dt.Rows[0][1].ToString();
                    address = dt.Rows[0][2].ToString();
                    city = dt.Rows[0][3].ToString();
                    type = dt.Rows[0][4].ToString();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            

        }


        protected void GetDoctorsOnBoard()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "Select DoctorProfile.*,UserAccounts.Username from DoctorProfile inner join UserAccounts on DoctorProfile.UserId=UserAccounts.UserId where DoctorProfile.DoctorId in(select DoctorId from Affiliations where InstituteId='" + Session["SelectedHospitalForDetailView"] + "')";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridViewDoctor.DataSource = dt;
                    GridViewDoctor.DataBind();

                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            

        }


        protected void FireRowCommandForDoctor(object sender, GridViewCommandEventArgs e)

        {
            string command = e.CommandName;
            string DoctorId = e.CommandArgument.ToString();
            switch (command)
            {
                case "ViewDetails":
                    {
                        Session["SelectedDoctorForDetailView"] = DoctorId;
                        Response.Redirect("~/DoctorDetail.aspx");
                        break;
                    }

            }
        }


    }
}