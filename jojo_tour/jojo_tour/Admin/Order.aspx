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
        <div class="row">

             <div class="col-12 col-lg-3 border text-center">
            <br />
            <h4>ตัวกรอง</h4>
            <hr />
            <div class="text-left">
                <h5>สถานะ</h5>

                <asp:CheckBoxList ID="CheckBoxListStatus" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="th_name" DataValueField="id" RepeatLayout="Flow" OnSelectedIndexChanged="CheckBoxListType_SelectedIndexChanged"></asp:CheckBoxList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="SELECT * FROM [book_status]"></asp:SqlDataSource>
            </div>
         
        </div>


            <div class="col-12 col-lg-9 my-2">
                <asp:GridView ID="GridViewOrder" runat="server" AutoGenerateColumns="False" DataKeyNames="b_code"  CssClass="table table-bordered" EmptyDataText="ไม่มีข้อมูล">
            <Columns>
                <asp:BoundField DataField="b_code" HeaderText="ผู้จอง" ReadOnly="True" SortExpression="b_code" />
                <asp:BoundField DataField="type_name" HeaderText="ประเภททัวร์" SortExpression="type_name" />
                <asp:BoundField DataField="th_name" HeaderText="สถานะทัวร์" SortExpression="th_name" />
                <asp:BoundField DataField="t_time" HeaderText="วันเวลาเดินทาง" SortExpression="t_time" />
               
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceOrder" runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="SELECT bt.book_code AS b_code, bt.travel_datetime AS t_time, tt.th_name AS type_name, book_status.th_name FROM book_tour AS bt INNER JOIN tour AS t ON bt.tour_code = t.tour_code INNER JOIN type_tour AS tt ON tt.id = t.type_tour_id INNER JOIN book_status_history ON bt.book_code = book_status_history.book_code INNER JOIN book_status ON book_status_history.status_id = book_status.id"></asp:SqlDataSource>
            </div>
        </div>
        
    </div>

</asp:Content>
