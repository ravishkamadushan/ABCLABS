<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="LabApplication.User.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../assets/css/Payment.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="book-section" style="width: 100%; height: 100%; background-repeat: no-repeat; background-size: auto; background-attachment: fixed; background-position: left;">

        <div class="container py-5">
            <div class="align-self-end">
                <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
            </div>
            <!-- For demo purpose -->
            <div class="row mb-4">
                <div class="col-lg-8 mx-auto text-center">
                    <h1 class="display-6">Service Payment Forms</h1>
                </div>
            </div>
            <!-- End -->
            <div class="row">
                <div class="col-lg-6 mx-auto">
                    <div class="card ">
                        <div class="card-header">
                            <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">
                                <!-- Credit card form tabs -->
                                <ul role="tablist" class="nav bg-light nav-pills rounded nav-fill mb-3">
                                    <li class="nav-item"><a data-toggle="pill" href="#credit-card" class="nav-link active "><i class="fas fa-credit-card mr-2"></i>Credit Card </a></li>
                                </ul>
                            </div>
                            <!-- End -->
                            <!-- Credit card form content -->
                            <div class="tab-content">
                                <!-- credit card info-->
                                <div id="credit-card" class="tab-pane fade show active pt-3">
                                    <form role="form" onsubmit="event.preventDefault()">
                                        <div class="form-group">
                                            <label for="txtName">
                                                <h6>Card Owner</h6>
                                            </label>
                                            <%--<input type="text" name="username" placeholder="Card Owner Name" required class="form-control ">--%>

                                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Card Owner Name"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                ErrorMessage="Name Cannot be Empty" ControlToValidate="txtName" ForeColor="Red"
                                                Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                ErrorMessage="Name must be in Characters" ForeColor="Red" ValidationExpression="^[A-Za-z]*$"
                                                ControlToValidate="txtName" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RegularExpressionValidator>
                                        </div>

                                        <div class="form-group">
                                            <label for="cardNumber">
                                                <h6>Card number</h6>
                                            </label>
                                            <div class="input-group">
                                                <asp:TextBox ID="txtCardNo" runat="server" CssClass="form-control" placeholder="Valid Card Number"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                    ErrorMessage="Card Number cannot be empty" ControlToValidate="txtCardNo" ForeColor="Red"
                                                    Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                    ErrorMessage="Card Number must be in 16 Digits" ForeColor="Red" ValidationExpression="[0-9]{16}"
                                                    ControlToValidate="txtCardNo" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RegularExpressionValidator>
                                                <span class="input-group-text text-muted"><i class="fab fa-cc-visa mx-1"></i><i class="fab fa-cc-mastercard mx-1"></i><i class="fab fa-cc-amex mx-1"></i></span>
                                            </div>
                                        </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-8">
                                        <div class="form-group">
                                            <label>
                                                <span class="hidden-xs">
                                                    <h6>Expiration Date</h6>
                                                </span>
                                            </label>
                                            <div class="input-group">
                                                <asp:TextBox ID="txtMonth" runat="server" CssClass="form-control" placeholder="MM" TextMode="Number"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                    ErrorMessage="Expiry Date cannot be empty" ControlToValidate="txtMonth" Text="*"
                                                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RequiredFieldValidator>
                                                <asp:TextBox ID="txtYear" runat="server" CssClass="form-control" placeholder="YY" TextMode="Number"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                    ErrorMessage="Expiry Date cannot be empty" ControlToValidate="txtYear" Text="*"
                                                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group mb-4">
                                            <label data-toggle="tooltip" title="Three digit CV code on the back of your card">
                                                <h6>CVV <i class="fa fa-question-circle d-inline"></i></h6>
                                            </label>
                                            <asp:TextBox ID="txtCvv" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="CVV Cannot be Empty"
                                                ControlToValidate="txtCvv" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                                ErrorMessage="CVV must be 3 Digits" ForeColor="Red" ValidationExpression="[0-9]{3}"
                                                ControlToValidate="txtCvv" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-footer">
                                    <asp:LinkButton ID="btnConfirm" runat="server"
                                        CssClass="subscribe btn btn-primary btn-block shadow-sm" OnClick="btnConfirm_Click">Confirm Payment</asp:LinkButton>
                                </div>

                                <div class="row">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ForeColor="Red"
                                        HeaderText="Fix the Following Errors" />
                                </div>
                            </div>
                            <!-- End -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
