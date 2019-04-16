<%@ Page Language="C#" EnableEventValidation="false" Title="Add Order" AutoEventWireup="true" MasterPageFile="~/SiteAdmin.master" CodeFile="AddOrder.aspx.cs" Inherits="Customer_PackageTour" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %></h3>
    <hr />

    <div class="row">
        <div class="col px-5 py-2 border m-1 bg-light order-1">
            <label class="h5 mt-3">รายละเอียดผู้จอง</label>
            <hr />
            <div class="form-group ">
                <label>ชื่อผู้จอง*</label>
                <asp:TextBox ID="TextBoxFname" CssClass="form-control " runat="server"></asp:TextBox>
                <asp:Label ID="errorFName" runat="server" Text="กรุณากรอกช่องนี้" class="text-danger" Visible="false">
                    <a href="#" onclick="alert('ในการกรอกข้อมูล คุณจำเป็นที่จะต้องกรอกข้อมูลทุกช่อง ที่มีเครื่องหมาย * ตามหลัง')" class="text-danger">กรุณากรอกช่องนี้</a></asp:Label>
            </div>

            <div class="form-group ">
                <label>นามสกุลผู้จอง*</label>
                <asp:TextBox ID="TextBoxLname" CssClass="form-control " runat="server"></asp:TextBox>
                <asp:Label ID="errorLName" runat="server" Text="กรุณากรอกช่องนี้" class="text-danger" Visible="false">
                    <a href="#" onclick="alert('ในการกรอกข้อมูล คุณจำเป็นที่จะต้องกรอกข้อมูลทุกช่อง ที่มีเครื่องหมาย * ตามหลัง')" class="text-danger">กรุณากรอกช่องนี้</a></asp:Label>

            </div>
            <div class="form-group ">
                <label>เบอร์โทร*</label>
                <asp:TextBox ID="TextBoxPhone" CssClass="form-control " runat="server"></asp:TextBox>
                <asp:Label ID="errorPhone" runat="server" Text="กรุณากรอกช่องนี้" class="text-danger" Visible="false">
                    <a href="#" onclick="alert('ในการกรอกข้อมูล คุณจำเป็นที่จะต้องกรอกข้อมูลทุกช่อง ที่มีเครื่องหมาย * ตามหลัง')" class="text-danger">กรุณากรอกช่องนี้</a></asp:Label>

            </div>

            <div class="form-group ">
                <label>อีเมลล์*</label>
                <asp:TextBox ID="TextBoxEmail" CssClass="form-control " runat="server"></asp:TextBox>
                <asp:Label ID="errorEmail" runat="server" Text="กรุณากรอกช่องนี้" class="text-danger" Visible="false">
                    <a href="#" onclick="alert('ในการกรอกข้อมูล คุณจำเป็นที่จะต้องกรอกข้อมูลทุกช่อง ที่มีเครื่องหมาย * ตามหลัง')" class="text-danger">กรุณากรอกช่องนี้</a></asp:Label>
            </div>

            <div class="row justify-content-end mx-1 form-group">
                <asp:Button ID="ButtonSave" runat="server" Text="บันทึกการจอง" CssClass="btn btn-success btn-block" OnClick="ButtonSave_Click" />
            </div>

            
        </div>

        <div class="col-12 col-md-8 border px-5 py-2 m-1 bg-light order-0">
            <label class="h5 mt-3">รายละเอียดทัวร์</label>
            <hr />

            <div>
                <div class="row " id="HideEdit">
                    <asp:HiddenField ID="HiddenFieldTypeTour" runat="server" />
                    <div class="col">
                        <asp:Button ID="ButtonSelectPT" runat="server" Text="เลือกเเพ็คเกจทัวร์" OnClientClick="ptSetModal();return false;" CssClass="btn btn-success btn-block" />
                    </div>
                    <div class="col">
                        <asp:Button ID="ButtonSelectCT" runat="server" Text="จัดทัวร์เอง" OnClientClick="ctSet();return false;" CssClass="btn btn-primary btn-block" />
                    </div>
                </div>
            </div>

            <div id="pt" runat="server">
                <%--เลือกเเพ็คเกจทัวร์ Modal--%>
                <div class="modal fade" id="PTDialog" tabindex="-1" role="dialog" aria-labelledby="PTDialogTitle" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="PTDialogTitle">เลือกเเพ็คเกจทัวร์</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <h6 class="text-danger">ค้นหาเลยสิ !!</h6>
                                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True"></asp:TextBox>

                                        <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand" OnPagePropertiesChanged="ListView1_PagePropertiesChanged">
                                            <EmptyDataTemplate>
                                                <span>ไม่ข้อมูล.</span>
                                            </EmptyDataTemplate>

                                            <ItemTemplate>

                                                <div class="col col-md-4 my-2">
                                                    <div class="card">
                                                        <img id="Image1" src='<%# Eval("img") %>' class="card-img-top img-fluid" onerror="this.onerror=null;this.src='/DataStorage/LocationImg/No_Image_Available.jpg'" />
                                                        <div class="card-body">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("t_th_name") %>' CssClass="card-title h5" />
                                                            <br />
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("id") %>' CssClass="card-title text-secondary" />
                                                            <br />
                                                            <asp:LinkButton runat="server"
                                                                ID="ViewButton"
                                                                Text="เลือก"
                                                           
                                                                CssClass="btn btn-danger btn-block"
                                                                CommandName="select_pkTour"
                                                                CommandArgument='<%# Eval("id") %>' />

                                                        </div>
                                                    </div>
                                                </div>


                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <div id="itemPlaceholderContainer" runat="server">
                                                    <div class="row m-3">
                                                        <span runat="server" id="itemPlaceholder" />
                                                    </div>

                                                </div>
                                                <div class="row justify-content-center mt-3">
                                                    <asp:DataPager ID="DataPagerPlace" runat="server" PageSize="3">
                                                        <Fields>
                                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-danger" />
                                                            <asp:NumericPagerField />
                                                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-danger" />
                                                        </Fields>
                                                    </asp:DataPager>
                                                </div>
                                            </LayoutTemplate>
                                        </asp:ListView>
                                    </ContentTemplate>

                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="ListView1" EventName="PagePropertiesChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>


                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal" >Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--PKTOUR-->
             <div class="bg-white border rounded p-3 my-2" id="PKShow" style="display:none">
                 เเพ็จเกจทัวร์
                 <asp:UpdatePanel ID="up1" runat="server">
                     <ContentTemplate>
                         <asp:DataList ID="DataList1" runat="server" DataKeyField="id" RepeatLayout="Flow">
                     <ItemTemplate>
                         <div class="row">
                             <div class="col">
                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("t_th_name") %>' CssClass="h5" />
                                 <asp:HiddenField ID="HiddenField1" Value='<%# Eval("id") %>' runat="server" />
                                 <hr />
                             </div>             
                         </div>

                          <div class="row">

                    <!--สถานที่ท่องเที่ยว-->
                    <div class="col-12">
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
                                <asp:ControlParameter Name="tour_id" ControlID="HiddenField1" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    </div>
                    
                    <!--ที่พัก-->
                    
                    <div class="col-12">
                        <div class="font-weight-bold mt-2">ที่พัก:</div>
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
                                <asp:ControlParameter Name="tour_id" ControlID="HiddenField1" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    </div>

                    </div>
                         <div class="row">
                             <div class="col-12 col-md my-2">
                                 <label>ราคา</label>
                                 <asp:TextBox ID="TextBoxPrice" runat="server" Text='<%# Eval("t_price") %>' CssClass="form-control " TextMode="Number" ></asp:TextBox>
                  
                    <br />
                             </div>
                         </div>
                     </ItemTemplate>
                 </asp:DataList>


                     </ContentTemplate>
                 </asp:UpdatePanel>

                 
             </div>
            <!--PKTOUR-->


            <!--PTour-->

            <div class="bg-white border rounded p-3 my-2" id="PTShow">
                            <!--Add Location-->
            <div class="row my-2">
                <!--ที่ท่องเที่ยว-->
                <div class="col-12 ">
                    <div class="row justify-content-between px-3">
                        <h6>ที่ท่องเที่ยว</h6>
                        <h6 class="text-danger txt-btn"  data-toggle="modal" data-target="#PlaceDialog">เพิ่ม</h6>
                    </div>
                    <div>
                         <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                       
                             <asp:ListView ID="ListViewPlaceSelected" runat="server" OnItemCommand="ListViewPlaceSelected_ItemCommand" >
                            <EmptyDataTemplate>
                                <div class="row  m-2">
                                    <span class="alert alert-secondary w-100 text-center">ไม่ข้อมูล.</span>
                                </div>
                            </EmptyDataTemplate>

                            <ItemTemplate>
                                <div class="col-12  my-2 overflow-hidden">
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
                                                        <asp:TextBox ID="TextBoxDate" runat="server" CssClass="form-control" TextMode="Number" Text="1"></asp:TextBox>
                                                    </div>                                                
                                                </div>
                                            </div>
                                            <div class="col-1">
                                                <div class="row align-items-start h-100 w-100 justify-content-end m-0 ">
                                                    <asp:Button ID="ButtonRemovePlace" CssClass="btn btn-danger h-100 "  runat="server" CommandName="remove_place" CommandArgument='<%# Eval("id") %>' UseSubmitBehavior="false" Text="x" ToolTip="เอาออก" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <div id="itemPlaceholderContainer" runat="server">
                                    <div class="row ">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>

                                </div>
                            </LayoutTemplate>
                        </asp:ListView>
                                </ContentTemplate>

                         </asp:UpdatePanel>
                    </div>
                </div>



                <!--ที่พัก-->
                <div class="col-12 ">
                    <div class="row justify-content-between px-3">
                        <h6>ที่พัก</h6>
                        <h6 class="text-danger txt-btn" data-toggle="modal" data-target="#HotelDialog">เพิ่ม</h6>
                    </div>
                    <div>
                           <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                          <asp:ListView ID="ListViewHotelSelected" runat="server" OnItemCommand="ListViewHotelSelected_ItemCommand">
                            <EmptyDataTemplate>
                                <div class="row mt-1 mx-2">
                                    <span class="alert alert-secondary w-100 text-center">ไม่ข้อมูล.</span>

                                </div>
                            </EmptyDataTemplate>

                            <ItemTemplate>
                                <div class="col-12  my-2 overflow-hidden">
                                    <asp:HiddenField ID="HiddenFieldHotelId" Value='<%# Eval("id") %>' runat="server" />
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
                                                        <asp:TextBox ID="TextBoxDate" runat="server" CssClass="form-control" TextMode="Number" Text="1"></asp:TextBox>
                                                    </div>                                                
                                                </div>
                                            </div>
                                            <div class="col-1">
                                                <div class="row align-items-start h-100 w-100 justify-content-end m-0 ">
                                                    <asp:Button ID="ButtonRemoveHotel" CssClass="btn btn-danger h-100 "  runat="server" CommandName="remove_hotel" CommandArgument='<%# Eval("id") %>' UseSubmitBehavior="false" Text="x" ToolTip="เอาออก" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </ItemTemplate>
                            <LayoutTemplate>
                                <div id="itemPlaceholderContainer" runat="server">
                                    <div class="row ">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>

                                </div>
                            </LayoutTemplate>
                        </asp:ListView>
                                </ContentTemplate>

                              
                           </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md my-2">
                    <label>ราคา</label>
                <asp:TextBox ID="TextBoxPrice" runat="server" CssClass="form-control " TextMode="Number" ></asp:TextBox>
                   
                    <br />
                </div>
    
            </div>

             <!--Modal-->
            <div>
                  <!-- Modal Place -->
            <div class="modal fade" id="PlaceDialog" tabindex="-1" role="dialog" aria-labelledby="ModalPTitle" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModalPTitle">เพิ่มที่ท่องเที่ยว</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <asp:UpdatePanel ID="PlaceViewUpdate" runat="server">
                                <ContentTemplate>
                                      <h6 class="text-danger">ค้นหาเลยสิ !!</h6>
                            <asp:TextBox ID="TextBoxPalce" CssClass="form-control" runat="server" OnTextChanged="TextBoxPalce_TextChanged" AutoPostBack="True"
></asp:TextBox>

                            <asp:ListView ID="ListViewPlace" runat="server" OnItemCommand="ListViewPlace_ItemCommand" OnPagePropertiesChanged="ListViewPlace_PagePropertiesChanged" >
                                <EmptyDataTemplate>
                                    <span>ไม่ข้อมูล.</span>
                                </EmptyDataTemplate>

                                <ItemTemplate>
                                    <div class="col-12  my-2">
                                        <div class="card">
                                            <div class="row wx-100">
                                                <div class="col">
                                                    <img id="Image1" src='<%# Eval("img") %>' class="img-fluid " onerror="this.onerror=null;this.src='/DataStorage/LocationImg/No_Image_Available.jpg'" />
                                                </div>
                                                <div class="col">
                                                    <div class="card-body">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("lo_th_name") %>' CssClass="card-title h5" />
                                                        <br />
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("p_th_name") %>' CssClass="card-title text-secondary" />

                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="row align-items-center h-100 justify-content-center">
                                                        <asp:Button ID="ButtonAddPlace" CssClass="btn btn-danger" runat="server" CommandName="add_place" CommandArgument='<%# Eval("id") %>' UseSubmitBehavior="false" Text="เพิ่ม"  />
                                                    </div>

                                                </div>
                                            </div>


                                        </div>
                                    </div>


                                </ItemTemplate>
                                <LayoutTemplate>
                                    <div id="itemPlaceholderContainer" runat="server">
                                        <div class="row m-3">
                                            <span runat="server" id="itemPlaceholder" />
                                        </div>

                                    </div>
                                    <div class="row justify-content-center mt-3">
                                        <asp:DataPager ID="DataPagerPlace" runat="server" PageSize="3" >
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-danger" />
                                                <asp:NumericPagerField />
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-danger" />
                                            </Fields>
                                        </asp:DataPager>
                                    </div>
                                </LayoutTemplate>
                            </asp:ListView>
                                </ContentTemplate>

                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ListViewPlace" EventName="PagePropertiesChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                          

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="location.reload();">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Modal Hotel -->
            <div class="modal fade" id="HotelDialog" tabindex="-1" role="dialog" aria-labelledby="ModalTitle" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModalTitle">เพิ่มโรงเเรม</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:UpdatePanel ID="HotelViewUpdate" runat="server">
                                <ContentTemplate>
                            <h6 class="text-danger">ค้นหาเลยสิ !!</h6>
                            <asp:TextBox ID="TextBoxHotel" CssClass="form-control" runat="server" OnTextChanged="TextBoxHotel_TextChanged" AutoPostBack="True"></asp:TextBox>

                            <asp:ListView ID="ListViewHotel" runat="server" OnItemCommand="ListViewHotel_ItemCommand"  OnPagePropertiesChanged="ListViewHotel_PagePropertiesChanged" >
                                <EmptyDataTemplate>
                                    <span>ไม่ข้อมูล.</span>
                                </EmptyDataTemplate>

                                <ItemTemplate>
                                    <div class="col-12  my-2">
                                        <div class="card">
                                            <div class="row wx-100">
                                                <div class="col">
                                                    <img id="Image1" src='<%# Eval("img") %>' class="img-fluid " onerror="this.onerror=null;this.src='/DataStorage/LocationImg/No_Image_Available.jpg'" />
                                                </div>
                                                <div class="col">
                                                    <div class="card-body">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("lo_th_name") %>' CssClass="card-title h5" />
                                                        <br />
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("p_th_name") %>' CssClass="card-title text-secondary" />

                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="row align-items-center h-100 justify-content-center">
                                                        <asp:Button ID="Button1" CssClass="btn btn-danger" runat="server" CommandName="add_hotel" CommandArgument='<%# Eval("id") %>' UseSubmitBehavior="false" Text="เพิ่ม" />
                                                    </div>

                                                </div>
                                            </div>


                                        </div>
                                    </div>


                                </ItemTemplate>
                                <LayoutTemplate>
                                    <div id="itemPlaceholderContainer" runat="server">
                                        <div class="row m-3">
                                            <span runat="server" id="itemPlaceholder" />
                                        </div>

                                    </div>
                                    <div class="row justify-content-center mt-3">
                                        <asp:DataPager ID="DataPagerHotel" UseSubmitBehavior="false" runat="server" PageSize="3" >
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-danger" />
                                                <asp:NumericPagerField />
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-danger" />
                                            </Fields>
                                        </asp:DataPager>
                                    </div>
                                </LayoutTemplate>
                            </asp:ListView>
                                </ContentTemplate>

                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ListViewHotel" EventName="PagePropertiesChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                          

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" runat="server" AutoPostBack="True">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            
            </div>
            <!--Modal-->

            </div>
           
            <!--PTour-->
               <div class="bg-white border rounded p-3 my-2">
                <label class="mt-2">รายละเอียดเพิ่มเติม</label>
                  <hr />

                    <label class="mt-1">เลือกสถานะของทัวร์</label>

                    <asp:DropDownList ID="DropDownListStatus" runat="server" CssClass="form-control" >
                        <asp:ListItem Value="1">อยู่ระหว่าการพิจารณา</asp:ListItem>
                        <asp:ListItem Value="2">ส่งหลักฐานทางการเงิน</asp:ListItem>
                        <asp:ListItem Value="3" >ถูกยกเลิก</asp:ListItem>
                        <asp:ListItem Value="4">ยืนยันการโอนเงิน</asp:ListItem>
                        <asp:ListItem Value="5">สำเร็จ</asp:ListItem>
                        <asp:ListItem Value="6">ล้มเเหลว</asp:ListItem>
                        <asp:ListItem Value="7">ทัวร์แล้ว</asp:ListItem>
                    </asp:DropDownList>

                   <br />

            <asp:Calendar ID="CalendarPicker" runat="server" CssClass="w-100" OnDayRender="CalendarPicker_DayRender"></asp:Calendar>
                  
                   
            <div class="row">
                 <div class="col-12 form-group">
                       <asp:Label ID="Label5" runat="server" Text="เวลานัดเจอ"></asp:Label>
                   <asp:DropDownList ID="DropDownListTimePicker" runat="server" CssClass="form-control">
                       <asp:ListItem>06:00</asp:ListItem>
                       <asp:ListItem>07:00</asp:ListItem>
                       <asp:ListItem>08:00</asp:ListItem>
                       <asp:ListItem>09:00</asp:ListItem>
                       <asp:ListItem>10:00</asp:ListItem>
                       <asp:ListItem>11:00</asp:ListItem>
                       <asp:ListItem>12:00</asp:ListItem>
                       <asp:ListItem>13:00</asp:ListItem>
                       <asp:ListItem>14:00</asp:ListItem>
                       <asp:ListItem>15:00</asp:ListItem>
                       <asp:ListItem>16:00</asp:ListItem>
                       <asp:ListItem>17:00</asp:ListItem>
                       <asp:ListItem>18:00</asp:ListItem>
                   </asp:DropDownList>
                   </div>

                <div class="col form-group">
                    <asp:Label ID="Label3" runat="server" Text="จำนวนเด็ก"></asp:Label>
                    <asp:DropDownList ID="DropDownListChildren"  CssClass="form-control" runat="server">
                        <asp:ListItem Selected="True">0</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col form-group">
                     <asp:Label ID="Label4" runat="server" Text="จำนวนผู้ใหญ่"></asp:Label>
                    <asp:DropDownList ID="DropDownListAdult"  CssClass="form-control" runat="server">
                        <asp:ListItem Selected="True">2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12 form-group">
                    <label>สถานที่นัดพบ</label>
                    <asp:TextBox ID="TextBoxMeetplace"  CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="col-12 form-group">
                    <label>รายละเอียดเพิ่มเติม</label>
                    <asp:TextBox ID="TextBoxMoredetail" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="col-12 form-group">
                <hr />
                <h6>หลักฐานการโอนเงิน</h6>
                <div class="col-12">
                   <asp:Image ID="ImgPayment" runat="server" ImageUrl="~/DataStorage/LocationImg/No_Image_Available.jpg" CssClass="w-100"/>
                </div>
            </div>

            </div>
        </div>
                
        </div>

     
    </div>

    <!-- JS -->
    <script type="text/javascript">
        function showModal() {
            $('#HotelDialog').modal('show');
        }
        function showPModal() {
            $('#PlaceDialog').modal('show');
        }
        function ptSetModal() {
            let hf = document.getElementById('<%= HiddenFieldTypeTour.ClientID %>').value = '1';
            $('#PTDialog').modal('show');
            PTShowHide();
            return;
        }
        function closePKModal()
        {
            $('#PTDialog').modal('toggle');
        }
        function ctSet() {
            let hf = document.getElementById('<%= HiddenFieldTypeTour.ClientID %>').value = '2';
   
            PTShowShow();
        }

        function PKShowShow()
        {
            document.getElementById("PKShow").style.display = 'block';
            document.getElementById("PTShow").style.display = 'none';
            
        }

         function PKShowHide()
        {
            document.getElementById("PTShow").style.display = 'block';
            document.getElementById("PKShow").style.display = 'none';
            
        }

        function PTShowShow()
        {
            document.getElementById("PTShow").style.display = 'block';
            $('#<%= ButtonSelectPT.ClientID %>').removeClass('btn-success');
            $('#<%= ButtonSelectPT.ClientID %>').addClass("btn-outline-success")

            $('#<%= ButtonSelectCT.ClientID %>').removeClass('btn-outline-primary');
            $('#<%= ButtonSelectCT.ClientID %>').addClass("btn-primary")

            PKShowHide()        
            
        }

         function PTShowHide()
        {
             document.getElementById("PTShow").style.display = 'none';
             $('#<%= ButtonSelectCT.ClientID %>').removeClass('btn-primary');
             $('#<%= ButtonSelectCT.ClientID %>').addClass("btn-outline-primary")

             $('#<%= ButtonSelectPT.ClientID %>').removeClass('btn-outline-success');
             $('#<%= ButtonSelectPT.ClientID %>').addClass("btn-success")
             PKShowShow()
            
            
        }

        function HideEdit() {
            
            document.getElementById("HideEdit").style.display = 'none';
        }
    </script>

</asp:Content>
