﻿using System;
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
    public partial class PatientProblems : System.Web.UI.Page
    {
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            getdata();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void getdata()
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string sql = "SELECT ProblemType,Severity,StartDate,EndDate,Notes FROM Problems where VisitId='" + Session["VisitID"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(sql, con);
                    dt = new DataTable();
                    da.Fill(dt);
                }
            }
            catch (Exception ex)
            {

                Session["Exception"] = ex;Response.Redirect("~/404.aspx");
            }
            
        }

    }
}