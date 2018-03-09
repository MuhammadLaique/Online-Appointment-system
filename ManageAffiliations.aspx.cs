using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace SignalRChat
{
    public partial class AddAffiliations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = GetData();
            GridView1.DataSource = ds;
            GridView1.DataBind();

            if (!this.IsPostBack)
            {
                BindInstituteList();
                PopulateCityList();
            }
        }

        private void BindInstituteList()
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select InstituteName from Institutes", con);
                    con.Open();
                    ddlInstitute.DataSource = cmd.ExecuteReader();
                    ddlInstitute.DataTextField = "InstituteName";
                    ddlInstitute.DataValueField = "InstituteName";
                    ddlInstitute.DataBind();
                    ddlInstitute.Items.Insert(0, new ListItem("Select Institute", "Select Institute"));
                    ddlInstitute.Items.Add(new ListItem("Other", "Other"));
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
        }

        protected void PopulateCityList()
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select CityName from Cities", con);
                    con.Open();
                    ddlcity2.DataSource = cmd.ExecuteReader();
                    ddlcity2.DataTextField = "CityName";
                    ddlcity2.DataValueField = "CityName";
                    ddlcity2.DataBind();
                    ddlcity2.Items.Insert(0, new ListItem("Select City", "Select City"));
                    ddlcity2.Items.Add(new ListItem("Other", "Other"));
                    con.Close();
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
        }


        private DataSet GetData()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string sql = "SELECT Affiliations.AffiliationId,Institutes.InstituteName as Institute,Affiliations.MondayFrom,Affiliations.MondayTo,Affiliations.TuesdayFrom,Affiliations.TuesdayTo,Affiliations.WednesdayFrom,Affiliations.WednesdayTo,Affiliations.ThursdayFrom,Affiliations.ThursdayTo,Affiliations.FridayFrom,Affiliations.FridayTo,Affiliations.SaturdayFrom,Affiliations.SaturdayTo,Affiliations.SundayFrom,Affiliations.SundayTo FROM Affiliations INNER JOIN Institutes ON Affiliations.InstituteId = Institutes.InstituteId where Affiliations.DoctorId='" + Session["DoctorId"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(sql, con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    return ds;
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            return null;
        }

        protected void ButtonSelect_Click(object sender, EventArgs e)
        {
            if(ddlInstitute.SelectedValue!= "Select Institute" && ddlInstitute.SelectedValue != "Other")
            {
                try
                {
                    String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("insert into Affiliations(DoctorId,InstituteId,Designation,MondayFrom,MondayTo,TuesdayFrom,TuesdayTo,WednesdayFrom,WednesdayTo,ThursdayFrom,ThursdayTo,FridayFrom,FridayTo,SaturdayFrom,SaturdayTo,SundayFrom,SundayTo) values('" + Session["DoctorId"] + "',(select InstituteId from Institutes where InstituteName='" + ddlInstitute.SelectedValue + "' ),'" + TextBoxDesignation.Text + "','" + ChangeTimeFormat(tbmonfrom.Text) + "' ,'" + ChangeTimeFormat(tbmonto.Text) + "' ,'" + ChangeTimeFormat(tbtuefrom.Text) + "' ,'" + ChangeTimeFormat(tbtueto.Text) + "' ,'" + ChangeTimeFormat(tbwedfrom.Text) + "' ,'" + ChangeTimeFormat(tbwedto.Text) + "' ,'" + ChangeTimeFormat(tbthufrom.Text) + "' ,'" + ChangeTimeFormat(tbthuto.Text) + "' ,'" + ChangeTimeFormat(tbfrifrom.Text) + "' ,'" + ChangeTimeFormat(tbfrito.Text) + "' ,'" + ChangeTimeFormat(tbsatfrom.Text) + "' ,'" + ChangeTimeFormat(tbsatto.Text) + "' ,'" + ChangeTimeFormat(tbsunfrom.Text) + "' ,'" + ChangeTimeFormat(tbsunto.Text) + "')", con);
                        con.Open();
                        cmd.ExecuteNonQuery();

                    }
                }
                catch (Exception ex)
                {

                    Session["Exception"] = ex;
                    Response.Redirect("~/404.aspx");
                }
                
            }
            
            else
             {
                lblError.Text = "Invalid Institute Selection !";
            }
        }
        protected void ButtonAddInstitute_Click(object sender, EventArgs e)
        {
            if(TextBoxInstitute.Text!="" && ddlcity2.Value!="Select City" && TextBoxAddress.Text=="")
            {
                try
                {
                    String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("insert into Institutes(InstituteName,Address,City,Type) values('" + TextBoxInstitute.Text + "','" + TextBoxAddress.Text + "','" + TextBoxCity.Text + "','" + SelectTypeList.Value + "')", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        BindInstituteList();
                        ddlInstitute.SelectedIndex = ddlInstitute.Items.Count - 2;
                        //cmd = new SqlCommand("insert into Affiliations(DoctorId,InstituteId,Designation,MondayFrom,MondayTo,TuesdayFrom,TuesdayTo,WednesdayFrom,WednesdayTo,ThursdayFrom,ThursdayTo,FridayFrom,FridayTo,SaturdayFrom,SaturdayTo,SundayFrom,SundayTo) values('" + Session["DoctorId"] + "',(select InstituteId from Institutes where InstituteName='" + TextBoxInstitute.Text + "' ),'" + TextBoxDesignation.Text + "','" +ChangeTimeFormat(tbmonfrom.Text) + "' ,'" + ChangeTimeFormat(tbmonto.Text) + "' ,'" + ChangeTimeFormat(tbtuefrom.Text) + "' ,'" + ChangeTimeFormat(tbtueto.Text) + "' ,'" + ChangeTimeFormat(tbwedfrom.Text) + "' ,'" + ChangeTimeFormat(tbwedto.Text) + "' ,'" + ChangeTimeFormat(tbthufrom.Text) + "' ,'" + ChangeTimeFormat(tbthuto.Text) + "' ,'" + ChangeTimeFormat(tbfrifrom.Text) + "' ,'" + ChangeTimeFormat(tbfrito.Text) + "' ,'" + ChangeTimeFormat(tbsatfrom.Text) + "' ,'" + ChangeTimeFormat(tbsatto.Text) + "' ,'" + ChangeTimeFormat(tbsunfrom.Text) + "' ,'" + ChangeTimeFormat(tbsunto.Text) + "')", con);
                        //cmd.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {
                    Session["Exception"] = ex;
                    Response.Redirect("~/404.aspx"); 
                }               
                
            }
            else
            {
                Label1.Text = "All fields are Mandatory.";                
            }
        }

        protected void ButtonAddCity_Click(object sender, EventArgs e)
        {
            if(TextBoxCity.Text!="")
            {
                try
                {
                    String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("insert into Cities values('" + TextBoxCity.Text + "')", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        PopulateCityList();
                    }
                }
                catch (Exception ex)
                {

                    Session["Exception"] = ex;
                    Response.Redirect("~/404.aspx");
                }
                
            }
            else
            {
                Label1.Text = "Enter City Name";
            }
        }

        protected string ChangeTimeFormat(string timeunformatted)
        {
            string timeformated=DateTime.Parse(timeunformatted, System.Globalization.CultureInfo.CurrentCulture).ToString("HH:mm:ss tt");
            return timeformated;
        }
        protected void FireRowCommand(object sender, GridViewCommandEventArgs e)

        {

            string command = e.CommandName;

            string affiliationId = e.CommandArgument.ToString();

            switch (command)

            {

                
                case "Update":
                    {
                        Session["AffiliationIdForChangingSchedule"] = affiliationId;
                        Response.Redirect("~/ManageSchedule.aspx");
                        break;
                    }

                case "Del":
                    {
                        try
                        {
                            string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                            using (SqlConnection con = new SqlConnection(CS))
                            {
                                SqlDataAdapter da = new SqlDataAdapter("delete from Affiliations where AffiliationId='" + affiliationId + "'", con);
                                DataTable dt = new DataTable();
                                da.Fill(dt);
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