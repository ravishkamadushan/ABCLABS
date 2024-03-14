<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="AppliedServices.aspx.cs" Inherits="LabApplication.User.AppliedServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* Add your CSS styles here */
        /* For example */
        .gridview {
            font-family: Arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

            .gridview th, .gridview td {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            .gridview tr:nth-child(even) {
                background-color: #f2f2f2;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main>
        <div>
            <div class="text-center">
                <h2>Applied Services</h2>
            </div>
            <div class="m-5">
                <asp:GridView ID="GridView1" runat="server" CssClass="gridview" AutoGenerateColumns="false" PageSize="5">
                    <Columns>
                        <asp:TemplateField HeaderText="Company Image">
                            <ItemTemplate>
                                <img width="60" src="<%# GetImageUrl( Eval("CompanyImage")) %>" alt="">
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="CompanyName" HeaderText="Doctor Name" />
                        <asp:BoundField DataField="Fee" HeaderText="Fee" />
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </main>

</asp:Content>
