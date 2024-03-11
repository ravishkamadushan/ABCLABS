<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="LabApplication.User.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <div class="container pt-15 pb-40">
             <div class="row">
      <div class="col-12 pb-20">
      <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
      </div>
     <div class="col-12">
         <h2 class="contact-title text-center">Sign Up</h2>
     </div>
     <div class="col-lg-8 mx-auto">
         <div  class="form-contact contact_form">
             <div class="row">
                 <div class="col-12">
                     <h6>Login Information</h6>
                 </div>
                 <div class="col-12">
                     <div class="form-group">
                         <label>Usename</label>
                         <asp:TextBox ID="txtUserName" class="form-control" placeholder="Enter Username" runat="server" 
                             required></asp:TextBox>
                     </div>
                 </div>

                 <div class="col-sm-6">
                     <div class="form-group">
                         <label>Password</label>
                         <asp:TextBox ID="txtPassword" class="form-control" placeholder="Enter Password" runat="server" TextMode="Password" 
                             required></asp:TextBox>
                     </div>
                 </div>

                 <div class="col-sm-6">
                     <div class="form-group">
                          <label>Confirm Password</label>
                          <asp:TextBox ID="txtConfirmPassword" class="form-control" placeholder="Re Enter Password" runat="server" TextMode="Password" 
                              required></asp:TextBox>
                         <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password must be match"
                             ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small"
                             ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
                     </div>
                 </div>

                 <div class="col-12">
                      <h6>Personal Information</h6>
                 </div>
                 <div class="col-12">
                    <div class="form-group">
                       <label>Full Name</label>
                        <asp:TextBox ID="txtFullName" class="form-control" placeholder="Enter Full Name" runat="server" 
                             required></asp:TextBox>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                             ErrorMessage="Name must be in characters only" ForeColor="Red" Display="Dynamic"
                             SetFocusOnError="true" Font-Size="Small" ValidationExpression="^[a-zA-Z\s]+$"
                             ControlToValidate="txtFullName"></asp:RegularExpressionValidator>
                     </div>
                </div>

                <div class="col-12">
                <div class="form-group">
                    <label>Address</label>
                    <asp:TextBox ID="txtAddress" class="form-control" placeholder="Enter Address" runat="server" 
                          TextMode="MultiLine" required></asp:TextBox>
                 </div>
              </div>   
                 
               <div class="col-12">
               <div class="form-group">
                   <label>Mobile Number</label>
                   <asp:TextBox ID="txtMobile" class="form-control" placeholder="Enter Mobile Number" runat="server" 
                        required></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                       ErrorMessage="Mobile Number must have 10 degits" ForeColor="Red" Display="Dynamic"
                             SetFocusOnError="true" Font-Size="Small" ValidationExpression="^[0-9]{10}$"
                             ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                  </div>
             </div>

               <div class="col-12">
               <div class="form-group">
                    <label>Email</label>
                    <asp:TextBox ID="txtEmail" class="form-control" placeholder="Enter Email" runat="server" TextMode="Email"
                        required></asp:TextBox>
               </div>
               </div> 
                 
                 <div class="col-12">
                     <div class="form-group">
                         <label>Select District</label>
                         <asp:DropDownList ID="ddlDistrict" runat="server" DataSourceID="SqlDataSource1" Width="158px"
                             CssClass="form-control w-100" AppendDataBoundItems="true" DataTextField="DistrictName" DataValueField="DistrictName">
                             <asp:ListItem Value="0">Select District</asp:ListItem>
                         </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="District is Required"
                             ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" ControlToValidate="ddlDistrict" 
                             InitialValue="0"></asp:RequiredFieldValidator>
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:labs %>" 
                             SelectCommand="SELECT [DistrictName] FROM [District]"></asp:SqlDataSource>
                     </div>
                 </div>     

             </div>
             <div class="form-group mt-3">
                 <asp:Button ID="btnregister" runat="server" Text="Register" CssClass="button button-contactForm boxed-btn mr-4" 
                     OnClick="btnregister_Click"/>
                 <span class="clickLink"><a href="../User/Login.aspx">Already Register? Click Here...</a></span>
             </div>
             </div>
     </div>
     </div>
     </div>
    </section>

</asp:Content>
