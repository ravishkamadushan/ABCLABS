<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="LabApplication.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" />
    <link rel ="stylesheet" href="../assets/css/adminDashboard.css"/>
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container pt-4">
        <div class="row">
            <div class="col-12 pb-3">
                <h2 class="text-center">Dashboard</h2>
            </div>

            <div class="col-md-10 mx-auto">
                <div class="row">

                    <%--User Count--%>
                    <div class="col-xl-3 col-lg-6">
                        <div class="card l-bg-cherry">
                            <div class="card-statistic-3 p-4">
                                <div class="card-icon card-icon-large">
                                    <i class="fas fa-users pr-2"></i>
                                </div>
                                <div class="mb-4">
                                    <h5 class="card-title mb-0">Total Users</h5>
                                </div>
                                <div class="row-align-items-center mb-2 d-flex">
                                    <div class="col-8">
                                        <h2 class="d-flex align-items-center mb-0">
                                            <%Response.Write(Session["person"]);%> 
                                        </h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                     <%--Service Count--%>
                    <div class="col-xl-3 col-lg-6">
                        <div class="card l-bg-blue-dark">
                            <div class="card-statistic-3 p-4">
                                <div class="card-icon card-icon-large">
                                    <i class="fas fa-briefcase pr-2"></i>
                                </div>
                                <div class="mb-4">
                                    <h5 class="card-title mb-0">Total Services</h5>
                                </div>
                                <div class="row-align-items-center mb-2 d-flex">
                                    <div class="col-8">
                                        <h2 class="d-flex align-items-center mb-0">
                                            <%Response.Write(Session["Doctors"]);%> 
                                        </h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                     <%--Appointment Count--%>
                    <div class="col-xl-3 col-lg-6">
                        <div class="card l-bg-green-dark">
                            <div class="card-statistic-3 p-4">
                                <div class="card-icon card-icon-large">
                                    <i class="fas fa-check-square pr-2"></i>
                                </div>
                                <div class="mb-4">
                                    <h5 class="card-title mb-0">Total Appointments</h5>
                                </div>
                                <div class="row-align-items-center mb-2 d-flex">
                                    <div class="col-8">
                                        <h2 class="d-flex align-items-center mb-0">
                                            <%Response.Write(Session["AppliedDoctors"]);%> 
                                        </h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--Message Count--%>
                    <div class="col-xl-3 col-lg-6">
                        <div class="card l-bg-orange-dark">
                            <div class="card-statistic-3 p-4">
                                <div class="card-icon card-icon-large">
                                    <i class="fas fa-comments pr-2"></i>
                                </div>
                                <div class="mb-4">
                                    <h5 class="card-title mb-0">Total Messages</h5>
                                </div>
                                <div class="row-align-items-center mb-2 d-flex">
                                    <div class="col-8">
                                        <h2 class="d-flex align-items-center mb-0">
                                            <%Response.Write(Session["Contact"]);%> 
                                        </h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>

        </div>
    </div>

</asp:Content>
