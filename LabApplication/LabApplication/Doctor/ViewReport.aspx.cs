using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LabApplication.Doctor
{
    public partial class ViewReport : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["labs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["doctor"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }
            if (!IsPostBack)
            {
                ShowAppliedService();
            }
        }

        private void ShowAppliedService()
        {
            string query = string.Empty;
            con = new SqlConnection(str);
            query = @"Select Row_Number() over(Order by (Select 1)) as [Sr.No],aj.ApplyDoctorsId,d.CompanyName,aj.ServiceId,d.Title,p.Mobile, 
                    p.Name,p.Email,p.Report from AppliedDoctors aj
                    inner join person p on aj.UserId = p.UserId
                    inner join Doctors d on aj.ServiceId = d.ServiceId";
            cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowAppliedService();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int appliedDoctorsId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                con = new SqlConnection(str);
                cmd = new SqlCommand("Delete from AppliedDoctors where ApplyDoctorsId = @id", con);
                cmd.Parameters.AddWithValue("@id", appliedDoctorsId);
                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lblmsg.Text = "Report Details Deleted Successfully...";
                    lblmsg.CssClass = "alert alert-success";
                }
                else
                {
                    lblmsg.Text = "Cannot delete this record.Plz try again...";
                    lblmsg.CssClass = "alert alert-danger";
                }
                GridView1.EditIndex = -1;
                ShowAppliedService();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }
    }
}