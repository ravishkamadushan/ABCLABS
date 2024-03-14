using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LabApplication.User
{
    public partial class AppliedServices : System.Web.UI.Page
    {
        string str = ConfigurationManager.ConnectionStrings["labs"].ConnectionString;
        string Username = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }
            if (!IsPostBack)
            {
                ShowAppliedServices();
            }
        }

        protected string GetImageUrl(Object url)
        {
            string url1 = "";
            if (string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
            {
                url1 = "~/Images/No_image.png";
            }
            else
            {
                url1 = string.Format("~/{0}", url);
            }
            return ResolveUrl(url1);
        }

        private void ShowAppliedServices()
        {
            if (Session["user"] != null)
            {
                Username = Session["user"].ToString();
                using (SqlConnection con = new SqlConnection(str))
                {
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter("SELECT dd.Title,dd.Fee, dd.CompanyName, dd.CompanyImage FROM Doctors dd INNER JOIN AppliedDoctors apd ON dd.ServiceId = apd.ServiceId INNER JOIN Person pp ON apd.UserId = pp.UserId WHERE pp.Username = @Username", con);
                    sda.SelectCommand.Parameters.AddWithValue("@Username", Username);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

       
    }
}