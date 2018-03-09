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
    public partial class ManagePrescriptions : System.Web.UI.Page
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
                    SqlCommand cmd = new SqlCommand("insert into Prescriptions(VisitId,Medication,Dosage,Frequency,Allowed) values('" + Session["VisitID"] + "','" + taMedication.Value + "','" + tbDosage.Text + "','" + tbFrequency.Text + "','Yes')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    getdata();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
        }
        protected void getdata()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string sql = "SELECT PrescriptionId,Medication,Dosage,Frequency,Allowed FROM Prescriptions where VisitId='" + Session["VisitID"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(sql, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView1.DataSource = dt;
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
            string PrescriptionId = e.CommandArgument.ToString();
            switch (command)
            {
                case "Deactivate":
                    {
                        try
                        {
                            string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                            using (SqlConnection con = new SqlConnection(CS))
                            {
                                SqlDataAdapter da = new SqlDataAdapter("update Prescriptions set Allowed='No' where PrescriptionId='" + PrescriptionId + "'", con);
                                DataTable dt = new DataTable();
                                da.Fill(dt);
                                getdata();
                            }
                        }
                        catch (Exception ex)
                        {

                            Session["Exception"] = ex;
                            Response.Redirect("~/404.aspx");
                        }
                        
                        break;
                    }
                case "Del":
                    {
                        try
                        {
                            string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                            using (SqlConnection con = new SqlConnection(CS))
                            {
                                SqlDataAdapter da = new SqlDataAdapter("delete from Prescriptions where PrescriptionId='" + PrescriptionId + "'", con);
                                DataTable dt = new DataTable();
                                da.Fill(dt);
                                getdata();
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