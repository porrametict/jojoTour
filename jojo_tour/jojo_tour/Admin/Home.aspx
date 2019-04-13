<%@ Page Language="C#" Title="Home" AutoEventWireup="true" MasterPageFile="~/SiteAdmin.master" CodeFile="Home.aspx.cs" Inherits="Customer_PackageTour" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %></h3>
    <hr />
    <div>
        ตารางงาน
    </div>
    <div class="row">
        <div class="col-md-9">
            <asp:Calendar ID="Calendar1" runat="server" CssClass="w-100 h-100" OnDayRender="Calendar1_DayRender"></asp:Calendar>
        </div>
        <div class="col-md">


        </div>
    </div>

</asp:Content>
