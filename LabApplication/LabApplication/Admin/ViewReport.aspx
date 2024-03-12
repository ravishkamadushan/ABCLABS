<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="ViewReport.aspx.cs" Inherits="LabApplication.Admin.ViewReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image: url('../Images/bg.jpg'); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class="container-fulid pt-4 pb-4">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>

            <h3 class="text-center">View Report List/Details</h3>

            <div class="row mb-3 pt-sm-3">
                <div class="col-md-12">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered"
                        EmptyDataText="No records to display.." AutoGenerateColumns="False" AllowPaging="True"
                        PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="ApplyDoctorsId"
                        OnRowDeleting="GridView1_RowDeleting" HeaderStyle-HorizontalAlign="Center">
                        <Columns>

                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="CompanyName" HeaderText="Company Name">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Title" HeaderText="Service Title">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Name" HeaderText="User Name">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Email" HeaderText="User Email">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Mobile" HeaderText="Mobile No">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="Report">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" 
                                        NavigateUrl='<%# DataBinder.Eval(Container,"DataItem.Report","../{0}") %>'>
                                        <i class="fas fa-download"></i>Download</asp:HyperLink>
                                    <asp:HiddenField ID="hdnServiceId" runat="server" Value='<%# Eval("ServiceId")%>' Visible="false"/>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center"/>
                            </asp:TemplateField>
                            <asp:CommandField CausesValidation="false" HeaderText="Delete" ShowDeleteButton="true"
                                DeleteImageUrl="../assets/img/icon/trashIcon.png" ButtonType="Image">
                                <ControlStyle Height="25px" Width="25px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>

                        </Columns>
                        <HeaderStyle BackColor="#7200cf" ForeColor="White" />
                    </asp:GridView>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
