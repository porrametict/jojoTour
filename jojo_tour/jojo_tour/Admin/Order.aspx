<%@ Page Language="C#" Title="Order" AutoEventWireup="true" MasterPageFile="~/SiteAdmin.master" CodeFile="Order.aspx.cs" Inherits="Customer_PackageTour" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %></h3>
    <hr />
     <div class="row">
        <div class="col-4 col-lg">
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-danger" NavigateUrl="~/Admin/AddOrder.aspx">เพิ่มออร์เดอร์</asp:HyperLink>
        </div>
        <div class="col  col-lg">
            <div class="form-inline d-flex justify-content-end">
                <asp:TextBox ID="TextBoxSearch" runat="server" CssClass="form-control mx-2" ></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-danger" Text="ค้นหา"  />
            </div>
        </div>
    </div>

    <div class="my-3">
        <asp:GridView ID="GridViewOrder" runat="server" AutoGenerateColumns="False" DataKeyNames="b_code" DataSourceID="SqlDataSourceOrder" CssClass="table table-bordered">
            <Columns>
                <asp:BoundField DataField="b_code" HeaderText="รหัสทัวร์" InsertVisible="False" ReadOnly="True" SortExpression="b_code" />
                <asp:BoundField DataField="type_name" HeaderText="ประเภทของทัวร์" SortExpression="type_name" />
                <asp:BoundField DataField="t_time" HeaderText="วันเวลาเดินทาง" SortExpression="t_time" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceOrder" runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="SELECT bt.book_code AS b_code, bt.travel_datetime AS t_time, tt.th_name AS type_name FROM book_tour AS bt INNER JOIN tour AS t ON bt.tour_code = t.tour_code INNER JOIN type_tour AS tt ON tt.id = t.type_tour_id "></asp:SqlDataSource>
    </div>

</asp:Content>
