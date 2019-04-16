<%@ Page Title="Tour Tracking" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="TourTracking.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %></h3>
    <hr />
    <div class="jumbotron jumbotron-fluid">
        <div class="container text-center">
            <h1 class="display-4">Tour Tracking</h1>
            <p class="lead">ติดตามทัวร์ของคุณอย่างง่ายได้ที่ Tour Tracking.</p>
            <div class="container px-5">
                <div class="row justify-content-center align-items-center">
                    <div class="col-12 col-md-4">
                        <asp:TextBox ID="TextBox" runat="server" CssClass="form-control "></asp:TextBox>

                    </div>
                    <div class="col-12 col-md-2 text-md-left text-center mt-md-0 mt-2">
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" Text="ตรวจสอบ" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    

   <div class="row mt-2">
       <div class="col-12 col-md-8 card p-3 mx-2">
             <h5 class="text-danger">สถานะการจอง</h5>
          <hr /> 

           <asp:DataList ID="DataListStatus" runat="server" DataSourceID="SqlDataSourceStatus">
               <ItemTemplate>
                  
             
                   <asp:Label ID="th_nameLabel" runat="server" CssClass="h4 text-dark" Text='<%# Eval("th_name") %>' />
                   <br />
                 
                   <asp:Label ID="th_detailLabel" runat="server" CssClass="text-secondary" Text='<%# Eval("th_detail") %>' />
                   <br />
                   <b class="text-secondary">เวลา:</b>
                   <asp:Label ID="created_atLabel" runat="server"  CssClass="text-secondary" Text='<%# Eval("created_at") %>' />
                   <br />
<br />
               </ItemTemplate>
             </asp:DataList>
             <asp:SqlDataSource ID="SqlDataSourceStatus" runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="SELECT book_status_history.created_at, book_status.th_name, book_status.th_detail FROM book_status INNER JOIN book_status_history ON book_status.id = book_status_history.status_id WHERE (book_status_history.book_code = @id) ORDER BY book_status_history.created_at DESC">
                 <SelectParameters>
                     <asp:QueryStringParameter Name="id" QueryStringField="id" />
                 </SelectParameters>
             </asp:SqlDataSource>



       </div>

       <div class="col card p-3">
           <h5 class="text-danger">ข้อมูลการจอง</h5>
          <hr />  
              <asp:DataList ID="DataList1" runat="server" DataKeyField="book_code" DataSourceID="SqlDataSource1">
           <ItemTemplate>
               รหัสจอง:
               <asp:Label ID="book_codeLabel" runat="server" Text='<%# Eval("book_code") %>' />
               <br />
               ชื่อผู้จอง:
               <asp:Label ID="c_firstnameLabel" runat="server" Text='<%# Eval("c_firstname") %>' />
               <br />
               นามสกุลผู้จอง:
               <asp:Label ID="c_lastnameLabel" runat="server" Text='<%# Eval("c_lastname") %>' />
               <br />
               ทัวร์:
               <asp:Label ID="th_nameLabel" runat="server" Text='<%# Eval("th_name") %>' /> 
               <br />
               ราคา:
               <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' /> บาท
               <br />
            
               วันเวลาเดินทาง:
               <asp:Label ID="travel_datetimeLabel" runat="server" Text='<%# Eval("travel_datetime") %>' />
               <br />
               
               <br />
           </ItemTemplate>
       </asp:DataList>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="SELECT book_tour.book_code, book_tour.c_firstname, book_tour.c_lastname, tour.price, tour.th_name, book_tour.travel_datetime, book_tour.number_of_children, book_tour.number_of_adults FROM tour INNER JOIN book_tour ON tour.tour_code = book_tour.tour_code WHERE (book_tour.book_code = @id)">
           <SelectParameters>
               <asp:QueryStringParameter Name="id" QueryStringField="id" />
           </SelectParameters>
       </asp:SqlDataSource>

                       <div>
                Upload Payment Slip
  
             <asp:FileUpload ID="FileUpload1" CssClass="form-control-file my-2" runat="server" />

            </div>


           

           <div class="row justify-content-end mx-1">
                <asp:Button ID="ButtonSave" runat="server" Text="อัพโหลด" CssClass="btn btn-success btn-block" OnClick="ButtonSave_Click"/>
           </div>
       </div>
    
   </div>
    
</asp:Content>
