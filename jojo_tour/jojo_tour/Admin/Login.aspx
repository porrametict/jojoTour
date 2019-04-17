<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="row w-100 justify-content-center align-items-center" style="min-height:
    100%">
        <div class="card">
            <div class=" text-danger card-header">
                <h5 class="">Login</h5>

            </div>
            <div class=" card-body">
                <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                <asp:TextBox ID="TextBoxUsername" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUname" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" ForeColor="#FF3300" ControlToValidate="TextBoxUsername" SetFocusOnError="True" CssClass="mb-2">กรุณากรอกช่องนี้</asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="TextBoxPassword" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" ForeColor="#FF3300" ControlToValidate="TextBoxPassword" SetFocusOnError="True">กรุณากรอกช่องนี้</asp:RequiredFieldValidator>

                <br />
                <asp:Button ID="ButtonLogin" runat="server" CssClass="btn btn-danger btn-block" Text="Login" OnClick="ButtonLogin_Click" />


            </div>

        </div>
    </div>





</asp:Content>

