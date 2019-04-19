<%@ Page Title="Review" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Review.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <h3><%: Title %></h3>
    <hr />
    <br />

    <div class="container">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="containermain">
                    <div class="commentboxfront">
                        <%-- <b>Bookcode :</b><asp:Label ID="Label4" runat="server" Text='<%#Eval("book_code") %>'></asp:Label><br />--%>
                        <br />
                        <asp:Label ID="Label5" runat="server" Text='<%#Eval("text") %>'></asp:Label><br />
                        <br />
                        <b>
                            <asp:Label ID="Label6" runat="server" Text="Rating : "></asp:Label></b>
                        <asp:Label ID="Label7" runat="server" Text='<%#Eval("rate") %>'></asp:Label><br />
                        <br />
                    </div>
                </div>
                <div class="containersecond">
                    <div class="namefront">
                        <b>Name : </b>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("c_firstname") %>'></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("c_lastname") %>'></asp:Label>
                        <b>Phone : </b>
                        <asp:Label ID="Label11" runat="server" Text='<%#Eval("c_phone") %>'></asp:Label>
                        <b>Email : </b>
                        <asp:Label ID="Label12" runat="server" Text='<%#Eval("c_email") %>'></asp:Label>
                        <b>Date : </b>
                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("created_at") %>'></asp:Label><br />
                    </div>
                </div>
                <br />
            </ItemTemplate>
        </asp:Repeater>
    </div>

        <div style="overflow: hidden;">
        <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
            <ItemTemplate>
                <asp:LinkButton ID="btnPage"
                    Style="padding: 8px; margin: 2px; background: #007acc; border: solid 1px blue; font: 8px;"
                    CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                    runat="server" ForeColor="white" Font-Bold="True" CausesValidation="false"><%# Container.DataItem %>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:Repeater>
    </div>


    <hr />
    <br />

    <div class="second">
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
                    <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Width="800px" class="form-control" Height="100px"></asp:TextBox>
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

