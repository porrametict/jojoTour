<%@ Page Title="Package Tour"  Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeFile="PackageTour.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %></h3>
    <hr />
    <div class="row">
        <div class="col-4 col-lg">
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-danger" NavigateUrl="~/Admin/AddPackageTour.aspx">เพิ่มเเพ็คเกจทัวร์</asp:HyperLink>
        </div>
        <div class="col  col-lg">
            <div class="form-inline d-flex justify-content-end">
                <asp:TextBox ID="TextBoxSearch" runat="server" CssClass="form-control mx-2" OnTextChanged="TextBoxSearch_TextChanged"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-danger" Text="ค้นหา" OnClick="btnSearch_Click" />
            </div>
        </div>
    </div>

    <div class="row my-2 mx-1">

          <div class="col-12 col-lg-2 border text-center">
            <br />
            <h4>ตัวกรอง</h4>
            <hr />
            <div class="text-left">
                <h5>ประเภท</h5>
                <asp:CheckBoxList ID="CheckBoxListType" AutoPostBack="true" runat="server" DataSourceID="SqlDataSourceType" DataTextField="th_name" DataValueField="id" RepeatLayout="Flow" OnSelectedIndexChanged="CheckBoxListType_SelectedIndexChanged"></asp:CheckBoxList>
                <asp:SqlDataSource ID="SqlDataSourceType" runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="SELECT * FROM [type_location]"></asp:SqlDataSource>
            </div>
            <hr />
            <div class="text-left">
                <h5>จังหวัด</h5>
                <asp:CheckBoxList ID="CheckBoxListProvince" AutoPostBack="true" runat="server" DataSourceID="SqlDataSourceProvince" DataTextField="th_name" DataValueField="id" RepeatLayout="Flow" OnSelectedIndexChanged="CheckBoxListProvince_SelectedIndexChanged"></asp:CheckBoxList>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceProvince" runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="SELECT * FROM [province]"></asp:SqlDataSource>
            </div>
        </div>


        <div class="col border">
            <asp:UpdatePanel ID="PlaceViewUpdate" runat="server">
                <ContentTemplate>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" OnItemCommand="ListView1_ItemCommand" OnPagePropertiesChanged="ListView1_PagePropertiesChanged">
                <EmptyDataTemplate>
                    <div class="row  m-2">
                        <span class="alert alert-secondary w-100 text-center">ไม่ข้อมูล.</span>
                    </div>
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
                                    Text="ดูข้อมูล"
                                    CssClass="btn btn-success btn-block"
                                    CommandName="view_btn"
                                    CommandArgument='<%# Eval("id") %>' />

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
                    <div class="row justify-content-center mt-3">
                        <asp:DataPager ID="DataPagerLocation" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                    <br />
                </LayoutTemplate>
            </asp:ListView>
                </ContentTemplate>

                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ListView1" EventName="PagePropertiesChanged" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>






</asp:Content>

