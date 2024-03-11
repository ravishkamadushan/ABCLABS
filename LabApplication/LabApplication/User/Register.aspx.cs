using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace LabApplication.User
{
    public partial class Register : System.Web.UI.Page
    {
        // Using Class level variables for holding database connection and command objects(E)
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["labs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e) 
        {

        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnregister_Click(object sender, EventArgs e)//(A)
        {
            try
            {
                // Creating SqlConnection object using connection string(p)
                con = new SqlConnection(str);

                // Creating SqlCommand object with query and SqlConnection object
                string query = @"Insert into person (Username,Password,Name,Address,Mobile,Email,District) values (@Username,@Password,@Name,@Address,@Mobile,@Email,@District)";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", txtUserName.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtConfirmPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Name", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@District", ddlDistrict.SelectedValue);
                con.Open();

                // Execute the query and get number of rows affected
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "User Register Successfull!!";
                    lblMsg.CssClass = "alert alert-success";
                    Clear();
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Cannot save record right now! plz try after some time";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch(SqlException ex)
            {
                if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>" + txtUserName.Text.Trim() + "</b> Username is already exist, try new one..";
                    lblMsg.CssClass = "alert alert-danger";
                }
                else 
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
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

        //Method to clear input fields (A,E)
        private void Clear()
        {
            txtUserName.Text = string.Empty;    
            txtPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
            txtFullName.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtEmail.Text = string.Empty;
            ddlDistrict.ClearSelection();

        }
    }
}