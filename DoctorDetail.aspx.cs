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
    public partial class DoctorDetail : System.Web.UI.Page
    {
        public string name, dob, gender, emailp, emails, phone1, phone2, addressp, city, specialization, qualification, experience, feemin, feemax, recommendations,username = null;
        public string age = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            GetDoctorPersonalData();
            GetDoctorSchedule();
            GetDoctorServices();
            GetDoctorDiseases();
            GetSimilarDoctors();
            GetDoctorReviews();
        }

        protected void GetDoctorPersonalData()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "Select DoctorProfile.*,UserAccounts.Username from DoctorProfile inner join UserAccounts on DoctorProfile.UserId=UserAccounts.UserId where DoctorId='" + Session["SelectedDoctorForDetailView"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    name = dt.Rows[0][2].ToString();
                    dob = dt.Rows[0][3].ToString();
                    gender = dt.Rows[0][4].ToString();
                    emailp = dt.Rows[0][5].ToString();
                    emails = dt.Rows[0][6].ToString();
                    phone1 = dt.Rows[0][7].ToString();
                    phone2 = dt.Rows[0][8].ToString();
                    addressp = dt.Rows[0][9].ToString();
                    city = dt.Rows[0][10].ToString();
                    specialization = dt.Rows[0][11].ToString();
                    qualification = dt.Rows[0][12].ToString();
                    experience = dt.Rows[0][13].ToString();
                    feemin = dt.Rows[0][14].ToString();
                    feemax = dt.Rows[0][15].ToString();
                    recommendations = dt.Rows[0][16].ToString();
                    username = dt.Rows[0][17].ToString();
                    int age = ConvertDobToAge(dob);
                }
            }
            catch (Exception ex)
            {
                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
        }

        protected int ConvertDobToAge(string dob)
        {
            DateTime dob2 = Convert.ToDateTime(dob);
            int age = 0;
            age = DateTime.Now.Year - dob2.Year;
            if (DateTime.Now.DayOfYear < dob2.DayOfYear)
                age = age - 1;
            return age;
        }


        protected void GetDoctorSchedule()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "Select DoctorProfile.*,UserAccounts.Username from DoctorProfile inner join UserAccounts on DoctorProfile.UserId=UserAccounts.UserId where DoctorProfile.DoctorId in(select DoctorId from Affiliations where InstituteId='" + Session["SelectedHospitalForDetailView"] + "')";
                    string query2 = "Select DoctorProfile.*,UserAccounts.Username from DoctorProfile inner join UserAccounts on DoctorProfile.UserId=UserAccounts.UserId where DoctorId='" + Session["SelectedDoctorForDetailView"] + "'";
                    string query3 = "select Affiliations.*,Institutes.* from Affiliations inner join Institutes on Affiliations.InstituteId=Institutes.InstituteId where Affiliations.DoctorId='" + Session["SelectedDoctorForDetailView"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(query3, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridViewSchedule.DataSource = dt;
                    GridViewSchedule.DataBind();

                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
        }

        protected void GetDoctorServices()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "Select ServiceName from DoctorOfferServices where DoctorId='" + Session["SelectedDoctorForDetailView"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridViewServices.DataSource = dt;
                    GridViewServices.DataBind();

                }
            }
            catch (Exception ex)
            {
                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
           
        }

        protected void GetDoctorDiseases()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "Select DiseaseName from DoctorCureDiseases where DoctorId='" + Session["SelectedDoctorForDetailView"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridViewDiseases.DataSource = dt;
                    GridViewDiseases.DataBind();

                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
        }

        protected void GetDoctorReviews()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "Select * from Reviews where ForId='" + Session["SelectedDoctorForDetailView"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridViewReviews.DataSource = dt;
                    GridViewReviews.DataBind();

                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
           
        }

        protected void GetSimilarDoctors()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "Select top 5 DoctorProfile.*,UserAccounts.Username from DoctorProfile inner join UserAccounts on DoctorProfile.UserId=UserAccounts.UserId where Doctorprofile.DoctorId !='" + Session["SelectedDoctorForDetailView"] + "' and Doctorprofile.Specialization =(select Specialization from Doctorprofile where Doctorid='" + Session["SelectedDoctorForDetailView"] + "')";
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

        protected void btnAppointment_Click(object sender, EventArgs e)
        {
            //try
            {
                string date = DateTime.Now.ToString("HH:mm:ss");
                string time = DateTime.Today.ToString("dd-MM-yyyy");
                string message = "Appointment Request For:" + TextBoxAppointment.Text + " Message:" + Message.Value;
                if (Session["UserName"] != null)
                {
                    if (TextBoxAppointment.Text != "" && TextBoxAppointment.Text != "")
                    {
                        String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(CS))
                        {
                            SqlCommand cmd = new SqlCommand("insert into Appointments (DoctorId,PatientId,Date,Time,Message,Responded) values('" + Session["SelectedDoctorForDetailView"] + "','" + Session["username"] + "','" + date + "','" + time + "','" + message + "','NO')", con);
                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }
                    else
                    {
                        AppointmentSectionValidator.Text = "Enter Problem Detaiils and Select Appointment Date and Time.";
                        AppointmentSectionValidator.ForeColor = Color.Red;
                    }

                }
                else
                {
                    Response.Redirect("~/Signin.aspx");
                }
            }
            //catch (Exception ex)
            //{
            //    Session["Exception"] = ex;
            //    Response.Redirect("~/404.aspx");
            //}
            
        }

        protected void ReviewButton_Click(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                if(RecomendationOption.Value!= "--Your Recommendation--" && tareason.Value!="")
                {

                    if(Session["UserType"].ToString()=="Doctor")
                    {
                        int newrec=0;
                        if(RecomendationOption.Value=="I Recommend")
                        {
                            newrec = GetRecommendationsFromDoctorProfile()+1;
                        }
                        if (RecomendationOption.Value == "I Discourage")
                        {
                            newrec = GetRecommendationsFromDoctorProfile() - 1;
                        }
                        if (!IsAlreadyReviewd())
                        {
                            try
                            {
                                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                                using (SqlConnection con = new SqlConnection(CS))
                                {
                                    SqlCommand cmd = new SqlCommand("insert into Reviews (ById,ForId,Recommendation,Reason) values('" + Session["PatientId"] + "','" + Session["SelectedDoctorForDetailView"] + "','" + RecomendationOption.Value + "','" + tareason.Value + "')", con);
                                    con.Open();
                                    cmd.ExecuteNonQuery();
                                    cmd = new SqlCommand("update DoctorProfile set Recommendations='" + newrec + "' where DoctorId='" + Session["SelectedDoctorForDetailView"] + "')", con);
                                    cmd.ExecuteNonQuery();
                                    ReviewValidator.Text = "Your FeedBack Delivered!";
                                    ReviewValidator.ForeColor = Color.Red;
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
                            try
                            {
                                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                                using (SqlConnection con = new SqlConnection(CS))
                                {
                                    SqlCommand cmd = new SqlCommand("update Reviews set Recommendation='" + RecomendationOption.Value + "' where ById='" + Session["PatientId"] + "' and ForId='" + Session["SelectedDoctorForDetailView"] + "'", con);
                                    con.Open();
                                    cmd.ExecuteNonQuery();
                                    cmd = new SqlCommand("update DoctorProfile set Recommendations='" + newrec + "' where DoctorId='" + Session["SelectedDoctorForDetailView"] + "')", con);
                                    cmd.ExecuteNonQuery();
                                    ReviewValidator.Text = "Your FeedBack Updated!";
                                    ReviewValidator.ForeColor = Color.Red;
                                }
                            }
                            catch (Exception ex)
                            {

                                Session["Exception"] = ex;
                                Response.Redirect("~/404.aspx");
                            }
                           
                        }
                    }
                    else
                    {
                        ReviewValidator.Text = "Only a Patient can Give Feedback!";
                        ReviewValidator.ForeColor = Color.Red;
                    }
                }
                else
                {
                    ReviewValidator.Text = "Please Give Complete Review!";
                    ReviewValidator.ForeColor = Color.Red;
                }
                
            }
            else
            {
                Response.Redirect("~/Signin.aspx");
            }
        }

        protected int GetRecommendationsFromDoctorProfile()
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "select Recommendations from  DoctorProfile where DoctorId='" + Session["SelectedDoctorForDetailView"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return int.Parse(dt.Rows[0][0].ToString());
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            return 0;
        }

        protected bool IsAlreadyReviewd()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string query = "Select ReviewId from Reviews where ById='" + Session["PatientId"] + "' and ForId='" + Session["SelectedDoctorForDetailView"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count == 1)
                    {
                        return true;
                    }
                    if (dt.Rows.Count == 0)
                    {
                        return false;
                    }
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;
                Response.Redirect("~/404.aspx");
            }
            
            return false;
        }
             

        protected void FireRowCommandForSchedule(object sender, GridViewCommandEventArgs e)

        {
            string command = e.CommandName;
            string HospitalId = e.CommandArgument.ToString();
            switch (command)
            {
                case "ViewDetails":
                    {
                        Session["SelectedHospitalForDetailView"] = HospitalId;
                        Response.Redirect("~/HospitalDetails.aspx");
                        break;
                    }

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