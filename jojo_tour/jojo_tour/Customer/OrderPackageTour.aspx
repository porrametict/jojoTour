<%@ Page Title="OrderPackageTour" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="OrderPackageTour.aspx.cs" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %></h3>
    <hr />
    <div class="container my-2 border">
        <div class="row overview-container">


            <div class="col-7 overview-left">

                <label class="h5 mt-3">รายละเอียดทัวร์</label>


                <asp:ListView ID="ListView1" runat="server">
                    <EmptyDataTemplate>
                        <div class="row  m-2">
                            <span class="alert alert-secondary w-100 text-center">ไม่ข้อมูล.</span>
                        </div>
                    </EmptyDataTemplate>

                    <ItemTemplate>
                        <div class="col-12 my-2">
                            <div class="card">
                                <img id="Image1" src='<%# Eval("img") %>' class="card-img-top img-fluid" onerror="this.onerror=null;this.src='/DataStorage/LocationImg/No_Image_Available.jpg'" />
                                <div class="card-body">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("t_th_name") %>' CssClass="card-title h5" />
                                    <br />
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("id") %>' CssClass="card-title text-secondary" />
                                    <br />

                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server">
                            <div class="row m-3 ">
                                <span runat="server" id="itemPlaceholder" />
                            </div>

                        </div>

                        </div>
                    <br />
                    </LayoutTemplate>
                </asp:ListView>



                <div class="col-3 m-5 overview-right">
                    <div class="card w-100 summary-details rounded-0">
                        <div class="card-body p-3">
                            <div class="row no-gutters">
                                <div class="mb-2 col-8">
                                    <div class="d-inline-block m-0 text-secondary">

                                        <label class="h5 mt-3">รายละเอียดผู้จอง</label>
                                        <hr />
                                        <div class="form-group ">
                                            <label>ชื่อ*</label>
                                            <asp:TextBox ID="TextBoxFname" CssClass="form-control " runat="server"></asp:TextBox>
                                            <asp:Label ID="errorFName" runat="server" Text="กรุณากรอกช่องนี้" class="text-danger" Visible="false">
                    <a href="#" onclick="alert('ในการกรอกข้อมูล คุณจำเป็นที่จะต้องกรอกข้อมูลทุกช่อง ที่มีเครื่องหมาย * ตามหลัง')" class="text-danger">กรุณากรอกช่องนี้</a></asp:Label>
                                        </div>

                                        <div class="form-group ">
                                            <label>นามสกุล*</label>
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
                                            <asp:Button runat="server"
                                                ID="ButtonSave"
                                                Text="จองทริปเลย"
                                                CssClass="btn btn-danger btn-lg btn-block" OnClick="ButtonSave_Click" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>







                </div>
            </div>




            <div>
                <div class="bg-white border rounded p-3 my-2 ">
                    <label class="mt-2">รายละเอียดเพิ่มเติม</label>
                    <hr />
                    <asp:DropDownList ID="DropDownListStatus" runat="server" CssClass="form-control" Visible="False">
                        <asp:ListItem Value="1" Selected="True">อยู่ระหว่าการพิจารณา</asp:ListItem>
                        <asp:ListItem Value="2">ส่งหลักฐานทางการเงิน</asp:ListItem>
                        <asp:ListItem Value="3">ถูกยกเลิก</asp:ListItem>
                        <asp:ListItem Value="4">ยืนยันการโอนเงิน</asp:ListItem>
                        <asp:ListItem Value="5">สำเร็จ</asp:ListItem>
                        <asp:ListItem Value="6">ล้มเเหลว</asp:ListItem>
                        <asp:ListItem Value="7">ทัวร์แล้ว</asp:ListItem>
                    </asp:DropDownList>

                    <br />
                    เลือกวันเดินทาง

            <asp:Calendar ID="CalendarPicker" runat="server" CssClass="w-100" OnDayRender="CalendarPicker_DayRender"></asp:Calendar>

                    <br />
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
                            <asp:DropDownList ID="DropDownListChildren" CssClass="form-control" runat="server">
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
                            <asp:DropDownList ID="DropDownListAdult" CssClass="form-control" runat="server">
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
                            <asp:TextBox ID="TextBoxMeetplace" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="col-12 form-group">
                            <label>รายละเอียดเพิ่มเติม</label>
                            <asp:TextBox ID="TextBoxMoredetail" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="col-12 form-group">
                            <hr />
                        </div>

                    </div>
                </div>
            </div>

        </div>


    </div>
</asp:Content>
