<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Admin_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="row w-100 justify-content-center align-items-center" style="min-height:400px">
        <div class="" >
            <asp:Label ID="Label" runat="server" Text="Username " CssClass="h1"></asp:Label>
            <asp:Label ID="LabelUname" runat="server" Text="Username" CssClass="h1 text-danger"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text="ได้ออกจากระบบเเล้ว" CssClass="h1"></asp:Label>

            <hr />
            <div class="row justify-content-center">

                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-success mx-5" NavigateUrl="~/Admin/Login.aspx">เข้าสู่ระบบใหม่</asp:HyperLink>
                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="btn btn-danger mx-5" NavigateUrl="~/Customer/Home.aspx">กลับหน้าของผู้ใช้</asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>

