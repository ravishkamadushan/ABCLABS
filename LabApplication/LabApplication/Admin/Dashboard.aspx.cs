using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LabApplication.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter sda;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["labs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }

            if (!IsPostBack)
            {
                users();
                services();
                AppliedServices();
                contactCount();
            }
        }

        private void contactCount()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from Contact", con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["Contact"] = dt.Rows[0][0];
            }
            else
            {
                Session["Contact"] = 0;
            }
        }

        private void AppliedServices()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from AppliedDoctors", con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["AppliedDoctors"] = dt.Rows[0][0];
            }
            else
            {
                Session["AppliedDoctors"] = 0;
            }
        }

        private void services()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from Doctors", con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["Doctors"] = dt.Rows[0][0];
            }
            else
            {
                Session["Doctors"] = 0;
            }
        }

        private void users()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from person", con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["person"] = dt.Rows[0][0];
            }
            else
            {
                Session["person"] = 0;
            }
        }
    }
}