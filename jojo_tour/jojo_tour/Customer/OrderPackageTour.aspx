<%@ Page Title="OrderPackageTour" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="OrderPackageTour.aspx.cs" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %></h3>
    <hr />
    <div>




        <div class="row overview-container">

            <div class="col-10 col-md-8 border px-5 py-2 m-3 bg-light order-0">


                <label class="h5 mt-3">รายละเอียดทัวร์</label>
                <hr />

                <%--- รายละเอียดทัวร์นั้นๆ ---%>
                <br />
                <br />
                <br />
                <br />
                ...............<br />
                ............<br />
                <br />
                <br />
                <br />

              <%--- ปฏิทิน ---%>

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

            </div>



            <div>
            <div class="col px-5 py-2 border m-3 bg-light">
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
                        CssClass="btn btn-danger btn-lg btn-block"
                        CommandName="order_btn"
                        CommandArgument='<%# Eval("id") %>' EnableTheming="True" />
                </div>


                <%--- <button type="button" class="btn btn-outline-primary btn-lg btn-block">
                                <div class="font-weight-bold">
                                    <img src="icon/phone.png" height="35" width="35" />
                                    &nbsp; &nbsp; &nbsp; &nbsp;
                                            083-XXX-XXXX
                                </div>
                            </button>

                            <button type="button" class="btn btn-outline-success btn-lg btn-block">
                                <div class="font-weight-bold">
                                    <img src="icon/line.png" height="35" width="35" />
                                    &nbsp; &nbsp; &nbsp;
                                            Line:@JOJOTour
                                </div>
                            </button> ---%>
            </div></div>




        </div>

        <br />
        <br />





    </div>

</asp:Content>
