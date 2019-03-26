<%@ Page Language="C#" Title="Package Tour" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="PackageTour.aspx.cs" Inherits="Customer_PackageTour" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %></h3>
    <hr />
    <div class="row">
        <div class="col  col-lg">
            <div class="form-inline d-flex justify-content-end">
                <asp:TextBox ID="TextBoxSearch" runat="server" CssClass="form-control mx-2"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-danger" Text="ค้นหา" />
            </div>

        </div>
    </div>
    <div class="row my-2 mx-1">
        <div class="col border">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" OnItemCommand="ListView1_ItemCommand">
                <EmptyDataTemplate>
                    <span>ไม่ข้อมูล.</span>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <div class="col col-md-4 my-2">
                        <div class="card" >
                            <img id="Image1" src='<%# Eval("img") %>' class="card-img-top img-fluid" onerror="this.onerror=null;this.src='/DataStorage/LocationImg/No_Image_Available.jpg'" />
                            <div class="card-body">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("lo_th_name") %>' CssClass="card-title h5"  />
                                <br />
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("p_th_name") %>' CssClass="card-title text-secondary" />
                                <br />
                                <asp:Button ID="ViewButton" CssClass="btn btn-success btn-block" runat="server" Text="ดูข้อมูล" CommandName="view_btn" CommandArgument='<%# Eval("id") %>' />
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
                </LayoutTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourceLocation" runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="SELECT location.id, location.en_name, location.th_name, province.th_name AS p_th_name, province.en_name AS p_en_name, type_location.th_name AS t_th_name, type_location.en_name AS t_en_name FROM location INNER JOIN province ON location.provice_id = province.id INNER JOIN type_location ON location.type_location_id = type_location.id"></asp:SqlDataSource>
        </div>
    </div>

</asp:Content>
