<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="NewService.aspx.cs" Inherits="LabApplication.Admin.NewService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image: url('../Images/bg.jpg'); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed">
        <div class="container pt-4 pb-4">
            <%--<div>
                <%--<asp:Label ID="lblMsg" runat="server"></asp:Label>--%>
           <%-- </div>--%>
            <div class="btn-toolbar justify-content-between mb-3">
                <div class="btn-group">
                     <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>
                <div class="input-group h-25">
                    <asp:HyperLink ID="linkBack" runat="server" CssClass="btn btn-secondary" Visible="false"
                        NavigateUrl="~/Admin/ServiceList.aspx">< Back</asp:HyperLink>
                </div>
            </div>

             <%--Take a Session Here--%>
            <h3 class="text-center"><%Response.Write(Session["title"]); %></h3>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtServiceTitle" style="font-weight: 600">Service Title</label>
                    <asp:TextBox ID="txtServiceTitle" runat="server" CssClass="form-control"
                        placeholder="Ex. Physiotheropy, Dermatologist" required></asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <label for="txtNoOfSlot" style="font-weight: 600">No Of Slots</label>
                    <asp:TextBox ID="txtNoOfSlot" runat="server" CssClass="form-control"
                        placeholder="Enter Number of Slots" TextMode="Number" required></asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-12 pt-3">
                    <label for="txtDescription" style="font-weight: 600">Service Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"
                        placeholder="Enter Service Description" TextMode="MultiLine" required></asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtQualification" style="font-weight: 600">Qualification</label>
                    <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control"
                        placeholder="Ex. MCA, BTech, MBA" required></asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <label for="txtExperience" style="font-weight: 600">Experience</label>
                    <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control"
                        placeholder="Ex. 1 Year, 2 Years" required></asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-12 pt-3">
                    <label for="txtLastDate" style="font-weight: 600">Available till</label>
                    <asp:TextBox ID="txtLastDate" runat="server" CssClass="form-control"
                        placeholder="Enter Last Date to avilable" TextMode="Date" required></asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtFee" style="font-weight: 600">Fee Per Day</label>
                    <asp:TextBox ID="txtFee" runat="server" CssClass="form-control"
                        placeholder="Enter Fee Per Day" required></asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <label for="ddlServiceType" style="font-weight: 600">Service Type</label>
                    <asp:DropDownList ID="ddlServiceType" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">Select Service Type</asp:ListItem>
                        <asp:ListItem>Full Time</asp:ListItem>
                        <asp:ListItem>Part Time</asp:ListItem>
                        <asp:ListItem>Remote</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ErrorMessage="Service Type is Required" ForeColor="Red"
                        ControlToValidate="ddlServiceType" InitialValue="0" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtCompany" style="font-weight: 600">Company Name</label>
                    <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control"
                        placeholder="Enter Company Name" required></asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <label for="fuCompanyLogo" style="font-weight: 600">Company Logo</label>
                    <asp:FileUpload ID="fuCompanyLogo" runat="server" CssClass="form-control" ToolTip=".jpg, .jpeg, .png extension only" />
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtWebsite" style="font-weight: 600">Website</label>
                    <asp:TextBox ID="txtWebsite" runat="server" CssClass="form-control"
                        placeholder="Enter Website Url" TextMode="Url"></asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <label for="txtEmail" style="font-weight: 600">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"
                        placeholder="Enter Email" TextMode="Email" required></asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-12 pt-3">
                    <label for="txtAddress" style="font-weight: 600">Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"
                        placeholder="Enter Address" TextMode="MultiLine" required></asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="ddlDistrict" style="font-weight: 600">District</label>
                    <asp:DropDownList ID="ddlDistrict" runat="server" DataSourceID="SqlDataSource1" Width="158px"
                        CssClass="form-control w-100" AppendDataBoundItems="true" DataTextField="DistrictName" DataValueField="DistrictName">
                        <asp:ListItem Value="0">Select District</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="District is Required"
                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" ControlToValidate="ddlDistrict"
                        InitialValue="0"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:labs %>"
                        SelectCommand="SELECT [DistrictName] FROM [District]"></asp:SqlDataSource>
                </div>

                <div class="col-md-6 pt-3">
                    <label for="txtNo" style="font-weight: 600">Contact No</label>
                    <asp:TextBox ID="txtNo" runat="server" CssClass="form-control"
                        placeholder="Enter Phone Number"  required></asp:TextBox>
                </div>
            </div>
            <div class="row mr-lg-5 ml-lg-5 mb-3 pt-4">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#7200cf"
                        Text="Add Service" OnClick="btnAdd_Click" />
                </div>
            </div>

        </div>
    </div>

</asp:Content>
