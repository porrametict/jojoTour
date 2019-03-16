<%@ Page Title="Place&Hotel" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeFile="PlaceAndHotel.aspx.cs" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %></h3>
    <hr />
    <div class="row">
        <div class="col">
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-danger" NavigateUrl="~/Admin/AddLocation.aspx">เพิ่มที่ท่องเที่ยวหรือที่พัก</asp:HyperLink>
        </div>
        <div class="col ">
            <div class="form-inline d-flex justify-content-end">
                <asp:TextBox ID="TextBoxSearch" runat="server" CssClass="form-control mx-2"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-danger" Text="ค้นหา" />
            </div>

        </div>
    </div>

</asp:Content>
