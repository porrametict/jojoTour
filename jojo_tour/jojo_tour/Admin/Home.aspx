<%@ Page Language="C#" Title="Home" AutoEventWireup="true" MasterPageFile="~/SiteAdmin.master" CodeFile="Home.aspx.cs" Inherits="Customer_PackageTour" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %></h3>
    <hr />

    <div class="row">
        <div class="col-md-9 border bg-gray">
            <h5 class=" mt-2 ">ตารางงาน</h5>
            <hr />
                <asp:Calendar ID="Calendar1" runat="server" CssClass="w-100 h-75" OnDayRender="Calendar1_DayRender"></asp:Calendar>

        </div>

        <div class="col-md border bg-gray">
            <h5 class="mt-2">การเเจ้งเตือน</h5>
            <hr />
            <asp:DataList ID="DataList1" runat="server" DataKeyField="book_code" DataSourceID="SqlDataSource1">
                <ItemTemplate>

                    <asp:Label ID="th_nameLabel" runat="server" CssClass="text-danger font-weiht-bold" Text='<%# Eval("th_name") %>' />
                    <br />
                    book_code:
                    <asp:Label ID="book_codeLabel" runat="server" Text='<%# Eval("book_code") %>' />
                    <br />
                    เวลา:
                    <asp:Label ID="created_atLabel" runat="server" Text='<%# Eval("created_at") %>' />
                    <div class="text-right">
                         <asp:HyperLink ID="HyperLink1" runat="server" CssClass="text-right" NavigateUrl='<%# Eval("book_code","AddOrder.aspx?id={0}") %>'>View</asp:HyperLink>
                    </div>
                   
                    
                    <hr />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="SELECT TOP (5) book_status.th_name, book_tour.book_code, book_status_history.created_at FROM book_status INNER JOIN book_status_history ON book_status.id = book_status_history.status_id INNER JOIN book_tour ON book_status_history.book_code = book_tour.book_code ORDER BY book_status_history.created_at DESC"></asp:SqlDataSource>
        </div>
    </div>

</asp:Content>
