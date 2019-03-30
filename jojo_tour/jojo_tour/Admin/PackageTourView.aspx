<%@ Page Language="C#" Title="PackageTour Detail" AutoEventWireup="true" MasterPageFile="~/SiteAdmin.master" CodeFile="PackageTourView.aspx.cs" Inherits="Customer_PackageTour" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %></h3>
    <hr />
    <div class="bg-white border rounded p-3">

        <asp:DataList ID="DataList1" runat="server" DataKeyField="id" DataSourceID="SqlDataSource1" RepeatLayout="Flow">
            <ItemTemplate>
                <div class="row">
                    <div class="col">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("en_name") %>' CssClass="h3" />
                        <br />
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("th_name") %>' CssClass="h3" />
                    </div>
                    <div class="col align-self-center ">
                        <div class="row w-100">
                            <div class="ml-auto">
                                <asp:Button ID="Button1" runat="server" Text="Edit" CssClass="btn btn-warning " OnClick="ButtonEdit_Click" />
                                <asp:Button ID="Button2" runat="server" Text="Delete" CssClass="btn btn-danger " OnClick="ButtonDel_Click" />
                            </div>

                        </div>
                    </div>
                </div>
                <!--รูป-->
                <div class="container my-2 border">
                    <div class="row ">
                        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style="width: 100%; height: 500px; overflow: hidden">
                            <asp:DataList ID="DataListImg" runat="server" DataKeyField="id" DataSourceID="SqlDataSourceIMGLocation" CssClass="carousel-inner h-100" RepeatLayout="Flow">
                                <ItemStyle CssClass="carousel-item h-100 w-100" />
                                <ItemTemplate>
                                    <img src='<%# Eval("image") %>' style="object-fit: cover; width: 100%; max-width: 100%; height: 100%; max-height: 100%" />
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSourceIMGLocation" runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="SELECT * FROM [image_location] where location_id in ( select location_id from tour_location tl where tl.tour_code = @tour_id )">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="tour_id" QueryStringField="id" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                            <script>
                                $('.carousel-item').each(function (i) {
                                    if (i === 0) {
                                        $(this).addClass('active');
                                    }
                                });
                            </script>
                        </div>
                    </div>
                </div>
                <!--รูป-->

                <div>
                    <div class="font-weight-bold">ปรเภทของสถานที่ในทัวร์:</div>
                    <asp:DataList ID="DataListType" runat="server" DataSourceID="SqlDataSourceTypeLo" DataKeyField="id" RepeatLayout="Flow">
                        <ItemStyle CssClass="mx-1" />
                        <ItemTemplate>
                            <asp:Label ID="t_location" runat="server" Text='<%# Eval("th_name") %>' />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSourceTypeLo" runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="select * from type_location where id in (select distinct l.type_location_id from tour_location tl inner join location l  on l.id = tl.location_id where tl.tour_code = @tour_id )">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="tour_id" QueryStringField="id" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <br />
                    <br />


                    <div class="font-weight-bold">จังหวัดที่ตั้งของสถานที่ในทัวร์:</div>
                     <asp:DataList ID="DataListProvince" runat="server" DataSourceID="SqlDataSourceProvince" DataKeyField="id" RepeatLayout="Flow">
                        <ItemStyle CssClass="mx-1" />
                        <ItemTemplate>
                            <asp:Label ID="p_location" runat="server" Text='<%# Eval("th_name") %>' />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSourceProvince" runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="select * from province where id in (select distinct l.province_id from tour_location tl inner join location l  on l.id = tl.location_id where tl.tour_code = @tour_id )">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="tour_id" QueryStringField="id" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />

                    <div class="font-weight-bold">รายละเอียดภาษาอังกฤษ:</div>
                    <asp:Label ID="en_detailLabel" runat="server" Text='<%# Eval("en_detail") %>' />
                    <br />
                    <br />

                    <div class="font-weight-bold">รายละเอียดภาษาไทย:</div>
                    <asp:Label ID="th_detailLabel" runat="server" Text='<%# Eval("th_detail") %>' />
                    <br />
                    <br />

                    <div class="row">

                    <!--สถานที่ท่องเที่ยว-->
                    <div class="col">
                        <div class="font-weight-bold">สถานที่ท่องเที่ยว:</div>
                    <br />
                    <div>
                        <asp:DataList ID="DataListPlace" runat="server" DataSourceID="SqlDataSourcePlace" DataKeyField="id" RepeatLayout="Flow">
                            <ItemStyle />
                            <ItemTemplate>
                               <div class="col-12  overflow-hidden">
                                    <asp:HiddenField ID="HiddenFieldPlaceId" Value='<%# Eval("id") %>' runat="server" />
                                    <div class="card" style="height: 100px;">
                                        <div class="row wx-100 " dir="ltr">
                                            <div class="col">
                                                <img id="Image1" style="height: 100px;" src='<%# Eval("img") %>' onerror="this.onerror=null;this.src='/DataStorage/LocationImg/No_Image_Available.jpg'" />
                                            </div>
                                            <div class="col">
                                                <div class="card-body">
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("lo_th_name") %>' CssClass="card-title h6" />
                                                    <br />
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("p_th_name") %>' CssClass="card-title text-secondary" />

                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="row align-items-center h-100 w-100 justify-content-center">
                                                    <div class="col p-0">
                                                        <asp:Label ID="lbDateOfTour" runat="server" Text="วันในทัวร์" Font-Size="Smaller"></asp:Label>
                                                        <asp:TextBox ID="TextBoxDate" runat="server" CssClass="form-control" TextMode="Number" Text='<%# Eval("dof") %>' ReadOnly="true"></asp:TextBox>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSourcePlace" runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="select l.id id ,tl.tour_code tour_code, l.th_name lo_th_name , p.th_name p_th_name ,ml.image img  , tl.date_of_tour dof from tour_location  tl inner join location l on l.id = tl.location_id inner join province p  on p.id = l.province_id left join image_location ml on ml.location_id = l.id and ml.id in (select min(id) from image_location Group by location_id) where tour_code = @tour_id and l.type_location_id in (select id from type_location where en_name != 'Hotel' )">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="tour_id" QueryStringField="id" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    </div>
                    
                    <!--ที่พัก-->
                    
                    <div class="col">
                        <div class="font-weight-bold">ที่พัก:</div>
                    <br />

                    <div>
                        <asp:DataList ID="DataListHotel" runat="server" DataSourceID="SqlDataSourceHotel" DataKeyField="id" RepeatLayout="Flow">
                            <ItemStyle />
                            <ItemTemplate>
                               <div class="col-12  overflow-hidden">
                                    <asp:HiddenField ID="HiddenFieldPlaceId" Value='<%# Eval("id") %>' runat="server" />
                                    <div class="card" style="height: 100px;">
                                        <div class="row wx-100 " dir="ltr">
                                            <div class="col">
                                                <img id="Image1" style="height: 100px;" src='<%# Eval("img") %>' onerror="this.onerror=null;this.src='/DataStorage/LocationImg/No_Image_Available.jpg'" />
                                            </div>
                                            <div class="col">
                                                <div class="card-body">
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("lo_th_name") %>' CssClass="card-title h6" />
                                                    <br />
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("p_th_name") %>' CssClass="card-title text-secondary" />

                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="row align-items-center h-100 w-100 justify-content-center">
                                                    <div class="col p-0">
                                                        <asp:Label ID="lbDateOfTour" runat="server" Text="วันในทัวร์" Font-Size="Smaller"></asp:Label>
                                                        <asp:TextBox ID="TextBoxDate" runat="server" CssClass="form-control" TextMode="Number" Text='<%# Eval("dof") %>' ReadOnly="true"></asp:TextBox>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSourceHotel" runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="select l.id id ,tl.tour_code tour_code, l.th_name lo_th_name , p.th_name p_th_name ,ml.image img  , tl.date_of_tour dof from tour_location  tl inner join location l on l.id = tl.location_id inner join province p  on p.id = l.province_id left join image_location ml on ml.location_id = l.id and ml.id in (select min(id) from image_location Group by location_id) where tour_code = @tour_id and l.type_location_id in (select id from type_location where en_name = 'Hotel' )">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="tour_id" QueryStringField="id" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    </div>

                    </div>
                    


                </div>



            </ItemTemplate>
        </asp:DataList>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="select tour_code id , * from tour where tour_code = @tour_id">
            <SelectParameters>
                <asp:QueryStringParameter Name="tour_id" QueryStringField="id" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>

</asp:Content>
