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
    public partial class ServiceDetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt, dt1;
        public int serviceCount = 0;
        string str = ConfigurationManager.ConnectionStrings["labs"].ConnectionString;
        public string serviceTitle = string.Empty;
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                showServiceDetails();
                DataBind();
            }
            else
            {
                Response.Redirect("ServiceListing.aspx");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void showServiceDetails()
        {
            con = new SqlConnection(str);
            string query = @"Select * from Doctors where ServiceId = @id";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
            serviceTitle = dt.Rows[0]["Title"].ToString();

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ApplyService")
            {
                if (Session["user"] != null)
                {
                    try
                    {
                        con = new SqlConnection(str);
                        string query = @"Insert into AppliedDoctors values(@ServiceId, @UserId)";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@ServiceId", Request.QueryString["id"]);
                        cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
                        con.Open();
                        int r = cmd.ExecuteNonQuery();
                        if (r > 0)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Sevice Applied Successful..";
                            lblMsg.CssClass = "alert alert-success";
                            showServiceDetails();

                            // Change button text and disable it
                            LinkButton btnApplyService = e.Item.FindControl("lbApplyService") as LinkButton;
                            btnApplyService.Enabled = false;
                            btnApplyService.Text = "Applied";

                            // Redirect to payment page
                            Response.Redirect("payment.aspx");
                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Cannot Applied for Service.Plz Try again..";
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
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (Session["user"] != null)
            {
                LinkButton btnApplyService = e.Item.FindControl("lbApplyService") as LinkButton;
                if (isApplied())
                {
                    btnApplyService.Enabled = false;
                    btnApplyService.Text = "Applied";

                }
                else
                {
                    btnApplyService.Enabled = true;
                    btnApplyService.Text = "Apply Now";

                }
            }
        }

        bool isApplied()
        {
            con = new SqlConnection(str);
            string query = @"Select * from AppliedDoctors where UserId=@UserId and ServiceId=@ServiceId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            cmd.Parameters.AddWithValue("@ServiceId", Request.QueryString["id"]);
            sda = new SqlDataAdapter(cmd);
            dt1 = new DataTable();
            sda.Fill(dt1);
            if (dt1.Rows.Count == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void lbApplyService_Click(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
            }
            else
            {
                Response.Redirect("Login.aspx");
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
    }
}