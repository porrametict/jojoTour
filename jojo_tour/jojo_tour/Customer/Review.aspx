<%@ Page Title="gggd" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Review.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container">
        <h4 style="text-decoration: underline;">Comments</h4>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="commentbox">
                    <b>Name :</b>
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("c_firstname") %>'></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("c_lastname") %>'></asp:Label><br />
                    <b>Date :</b>
                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("created_at") %>'></asp:Label><br />
                    <b>Bookcode :</b>
                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("book_code") %>'></asp:Label><br />
                    <br />
                    <asp:Label ID="Label5" runat="server" Text='<%#Eval("text") %>'></asp:Label>
                    <b>
                        <asp:Label ID="Label6" runat="server" Text="Rating : "></asp:Label></b>
                    <asp:Label ID="Label7" runat="server" Text='<%#Eval("rate") %>'></asp:Label><br />
                    <br />
                    <b>Phone :</b>
                    <asp:Label ID="Label8" runat="server" Text='<%#Eval("c_phone") %>'></asp:Label>
                    &nbsp;<b>Email :</b>
                    <asp:Label ID="Label9" runat="server" Text='<%#Eval("c_email") %>'></asp:Label><br />

                    <br />
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <div style="overflow: hidden;">
            <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
                <ItemTemplate>
                    <asp:LinkButton ID="btnPage"
                        Style="padding: 8px; margin: 2px; background: #007acc; border: solid 1px blue; font: 8px;"
                        CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                        runat="server" ForeColor="White" Font-Bold="True" CausesValidation="false"><%# Container.DataItem %>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <br />
    </div>


    <div class="container">
        <div class="form-group">
            <div class="form-inline">
                <label for="txtbook_code" class="Secondary">รหัสทัวร์</label><br />
                <div class="form-group">
                    &nbsp;&nbsp;
                    <asp:TextBox ID="txtbook_code" runat="server" Width="280px" CssClass="form-control form-control-sm" aria-describedby="book_codeHelpInline"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtbook_code" ErrorMessage="Please Provide Bookcode" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    <small id="book_codeHelpInline" class="text-muted">32 characters long</small>

                </div>
            </div>

            <div class="form-group">
                <br />
                <label for="txtComment">รีวิว</label><br />
                <div class="form-group">
                    <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Width="800px" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtComment" ErrorMessage="Please Provide Comment" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label for="gender">Rating</label>
                <div class="custom-control custom-radio custom-control-inline">
                    <asp:RadioButton ID="RadioButton1" runat="server" Font-Bold="False" Text="1" Font-Names="Arial" Checked="True" GroupName="A" />&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="RadioButton2" runat="server" Font-Bold="False" Text="2" Font-Names="Arial" GroupName="A" />&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="RadioButton3" runat="server" Font-Bold="False" Text="3" Font-Names="Arial" GroupName="A" />&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="RadioButton4" runat="server" Font-Bold="False" Text="4" Font-Names="Arial" GroupName="A" />&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="RadioButton5" runat="server" Font-Bold="False" Text="5" Font-Names="Arial" GroupName="A" />&nbsp;&nbsp;&nbsp;
                </div>
            </div>
        </div>

        <div>
            <div class="auto-style1">
                <asp:Button ID="btn_Submit" runat="server" Text="Post Comment" OnClick="btn_Submit_Click" CssClass="btn btn-danger" />
            </div>
            <div>&nbsp;</div>
        </div>
    </div>


</asp:Content>

