using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LabApplication.Admin
{
    public partial class NewService : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string query;
        string str = ConfigurationManager.ConnectionStrings["labs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }
            Session["title"] = "Add Service";
            if (!IsPostBack)
            {
                fillData();
            }
        }

        private void fillData()
        {
           if (Request.QueryString["id"] != null)
            {
                con = new SqlConnection(str);
                query = "Select * from Doctors where ServiceId = '" + Request.QueryString["id"] +"' ";
                cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        txtServiceTitle.Text = sdr["Title"].ToString();
                        txtNoOfSlot.Text = sdr["NoOfSlots"].ToString();
                        txtDescription.Text = sdr["Description"].ToString();
                        txtQualification.Text = sdr["Qualification"].ToString();
                        txtExperience.Text = sdr["Experience"].ToString();
                        txtLastDate.Text = Convert.ToDateTime( sdr["LastDateToApply"]).ToString("yyyy-MM-dd");
                        txtFee.Text = sdr["Fee"].ToString();
                        ddlServiceType.SelectedValue = sdr["ServiceType"].ToString();
                        txtCompany.Text = sdr["CompanyName"].ToString();
                        txtWebsite.Text = sdr["Website"].ToString();
                        txtEmail.Text = sdr["Email"].ToString();
                        txtAddress.Text = sdr["Address"].ToString();
                        txtNo.Text = sdr["ContactNo"].ToString();
                        ddlDistrict.SelectedValue = sdr["District"].ToString();
                        btnAdd.Text = "Update";
                        linkBack.Visible = true;
                        Session["title"] = "Edit Service";

                    }
                }
                else
                {
                    lblMsg.Text = "Service not Found..";
                    lblMsg.CssClass = "alert alert-danger";
                }
                sdr.Close();
                con.Close();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string type,concatQuery, imagePath = string.Empty;
                bool isValidToExecute = false;
                con = new SqlConnection(str);
                if (Request.QueryString["id"] != null)
                {
                    if (fuCompanyLogo.HasFile)
                    {
                        if (Utils.IsValidExtension(fuCompanyLogo.FileName))
                        {
                            concatQuery = "CompanyImage=@CompanyImage,";
                        }
                        else
                        {
                            concatQuery = string.Empty ;
                        }
                    }
                    else
                    {
                        concatQuery = string.Empty;
                    }

                    query = @"Update Doctors set  Title=@Title,NoOfSlots=@NoOfSlots,Description=@Description,Qualification=@Qualification,
                            Experience=@Experience,LastDateToApply=@LastDateToApply,Fee=@Fee,ServiceType=@ServiceType,
                            CompanyName=@CompanyName, "+ concatQuery +@" Website=@Website,Email=@Email,Address=@Address,ContactNo=@ContactNo,
                            District=@District where ServiceId=@id";
                    type = "updated";

                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Title", txtServiceTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@NoOfSlots", txtNoOfSlot.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text.Trim());
                    cmd.Parameters.AddWithValue("@Experience", txtExperience.Text.Trim());
                    cmd.Parameters.AddWithValue("@LastDateToApply", txtLastDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@Fee", txtFee.Text.Trim());
                    cmd.Parameters.AddWithValue("@ServiceType", ddlServiceType.SelectedValue);
                    cmd.Parameters.AddWithValue("@CompanyName", txtCompany.Text.Trim());
                    cmd.Parameters.AddWithValue("@Website", txtWebsite.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@ContactNo", txtNo.Text.Trim());
                    cmd.Parameters.AddWithValue("@District", ddlDistrict.SelectedValue);
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                    if (fuCompanyLogo.HasFile)
                    {
                        if (Utils.IsValidExtension(fuCompanyLogo.FileName))
                        {
                            Guid obj = Guid.NewGuid();
                            imagePath = "Images/" + obj.ToString() + fuCompanyLogo.FileName;
                            fuCompanyLogo.PostedFile.SaveAs(Server.MapPath("~/Images/") + obj.ToString() + fuCompanyLogo.FileName);

                            cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                            isValidToExecute = true;
                        }
                        else
                        {
                            lblMsg.Text = "Please select .jpg, .jpeg, .png file for Logo";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        isValidToExecute = true;
                    }


                }
                else
                {
                    query = "Insert into Doctors values(@Title,@NoOfSlots,@Description,@Qualification,@Experience," +
                   "@LastDateToApply,@Fee,@ServiceType,@CompanyName,@CompanyImage,@Website,@Email,@Address,@ContactNo,@District,@CreateDate)";
                    type = "saved";
                    DateTime time = DateTime.Now;
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Title", txtServiceTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@NoOfSlots", txtNoOfSlot.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text.Trim());
                    cmd.Parameters.AddWithValue("@Experience", txtExperience.Text.Trim());
                    cmd.Parameters.AddWithValue("@LastDateToApply", txtLastDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@Fee", txtFee.Text.Trim());
                    cmd.Parameters.AddWithValue("@ServiceType", ddlServiceType.SelectedValue);
                    cmd.Parameters.AddWithValue("@CompanyName", txtCompany.Text.Trim());
                    cmd.Parameters.AddWithValue("@Website", txtWebsite.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@ContactNo", txtNo.Text.Trim());
                    cmd.Parameters.AddWithValue("@District", ddlDistrict.SelectedValue);
                    cmd.Parameters.AddWithValue("@CreateDate", time.ToString("yyyy-MM-dd HH:mm:ss"));
                    if (fuCompanyLogo.HasFile)
                    {
                        if (Utils.IsValidExtension(fuCompanyLogo.FileName))
                        {
                            Guid obj = Guid.NewGuid();
                            imagePath = "Images/" + obj.ToString() + fuCompanyLogo.FileName;
                            fuCompanyLogo.PostedFile.SaveAs(Server.MapPath("~/Images/") + obj.ToString() + fuCompanyLogo.FileName);

                            cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                            isValidToExecute = true;
                        }
                        else
                        {
                            lblMsg.Text = "Please select .jpg, .jpeg, .png file for Logo";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                        isValidToExecute = true;
                    }       
                }
                if (isValidToExecute)
                {
                    con.Open();
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        lblMsg.Text = "Service" + type + "Successfull..";
                        lblMsg.CssClass = "alert alert-success";
                        clear();
                    }
                    else
                    {
                        lblMsg.Text = "Cannot" + type + "the records, please try after sometime..";
                        lblMsg.CssClass = "alert alert-danger";
                    }
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

        private void clear()
        {
            txtServiceTitle.Text = string.Empty;
            txtNoOfSlot.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtQualification.Text = string.Empty;
            txtExperience.Text = string.Empty;
            txtLastDate.Text = string.Empty;
            txtFee.Text = string.Empty;
            txtCompany.Text = string.Empty;
            txtWebsite.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtNo.Text = string.Empty;
            ddlServiceType.ClearSelection();
            ddlDistrict.ClearSelection();
        }

        //private bool IsValidExtension(string fileName)
        //{
        //    bool isValid = false;
        //    string[] fileExtension = { ".jpg", ".png", ".jpeg" };
        //    for (int i = 0; i <= fileExtension.Length - 1; i++)
        //    {
        //        if (fileName.Contains(fileExtension[i]))
        //        {
        //            isValid = true;
        //            break;
        //        }
        //    }
        //    return isValid;
        //}
    }
}