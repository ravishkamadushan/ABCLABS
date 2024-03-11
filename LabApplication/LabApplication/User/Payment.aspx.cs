using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LabApplication.User
{
    public partial class Payment : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["labs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                // Creating SqlConnection object using connection string(p)
                con = new SqlConnection(str);

                // Creating SqlCommand object with query and SqlConnection object
                string query = @"Insert into Cards (Name,Cardno,EXMonth,EXYear,CVV,PayDate) values (@Name,@Cardno,@EXMonth,@EXYear,@CVV,@PayDate)";
                DateTime time = DateTime.Now;
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Cardno", txtCardNo.Text.Trim());
                cmd.Parameters.AddWithValue("@EXMonth", txtMonth.Text.Trim());
                cmd.Parameters.AddWithValue("@EXYear", txtYear.Text.Trim());
                cmd.Parameters.AddWithValue("@CVV", txtCvv.Text.Trim());
                cmd.Parameters.AddWithValue("@PayDate", time.ToString("yyyy-MM-dd HH:mm:ss"));
                con.Open();

                // Execute the query and get number of rows affected
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "User Payment Successfull!!";
                    lblMsg.CssClass = "alert alert-success";
                    Clear();
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Cannot Pay right now! plz try after some time";
                    lblMsg.CssClass = "alert alert-danger";
                }
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

        private void Clear()
        {
            txtName.Text = string.Empty;
            txtCardNo.Text = string.Empty;
            txtMonth.Text = string.Empty;
            txtYear.Text = string.Empty;
            txtMonth.Text = string.Empty;
            txtCvv.Text = string.Empty;
        }
    }
}