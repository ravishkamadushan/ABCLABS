<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LabApplication.User.Login" %>
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
      <h2 class="contact-title text-center">Sign In</h2>
  </div>
  <div class="col-lg-8 mx-auto">
      <div  class="form-contact contact_form">
          <div class="row">      
              <div class="col-12">
                  <div class="form-group">
                      <label>Usename</label>
                      <asp:TextBox ID="txtUserName" CssClass="form-control" placeholder="Enter Username" runat="server" 
                          required></asp:TextBox>
                  </div>
              </div>

              <div class="col-12">
                  <div class="form-group">
                      <label>Password</label>
                      <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Enter Password" runat="server" TextMode="Password" 
                          required></asp:TextBox>
                  </div>
              </div>

               <div class="col-12">
                   <div class="form-group">
                       <label>Login Type</label>
                       <asp:DropDownList ID="ddlLoginType" CssClass="form-control w-100" runat="server">
                           <asp:ListItem Value="0">Select Login Type</asp:ListItem>
                           <asp:ListItem>Admin</asp:ListItem>
                           <asp:ListItem>User</asp:ListItem>
                           <asp:ListItem>Doctor</asp:ListItem>
                       </asp:DropDownList>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User type is Required"
                           ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" ControlToValidate="ddlLoginType" 
                           InitialValue="0"></asp:RequiredFieldValidator>
                   </div>
               </div>
              </div>

          <div class="form-group mt-3">
              <asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="button button-contactForm boxed-btn mr-4" 
                  OnClick="btnlogin_Click"/>
              <span class="clickLink"><a href="../User/Register.aspx">New User? Click Here...</a></span>
          </div>
          </div>
  </div>
  </div>
  </div>
 </section>

</asp:Content>
