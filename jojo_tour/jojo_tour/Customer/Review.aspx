<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Review.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 86px;
        }

        .auto-style2 {
            width: 201px;
        }
    </style>
    <link href="StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="formDesign">
                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style1">BookCode</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtbook_code" runat="server" Width="185px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtbook_code" ErrorMessage="Please Provide Bookcode" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--<tr>
                        <td class="auto-style1">BookCode</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtBookCode" runat="server" Width="185px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBookCode" Display="Dynamic" ErrorMessage="Please Provide BookCode" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="auto-style1">Comment</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtComment" runat="server" Height="44px" TextMode="MultiLine" Width="185px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtComment" ErrorMessage="Please Provide Comment" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Rating</td>
                        <td class="auto-style2">
                            <asp:RadioButton ID="RadioButton1" runat="server" Font-Bold="False" Text="1" Font-Names="Arial" Checked="True" GroupName="A" />
                            <asp:RadioButton ID="RadioButton2" runat="server" Font-Bold="False" Text="2" Font-Names="Arial" GroupName="A" />
                            <asp:RadioButton ID="RadioButton3" runat="server" Font-Bold="False" Text="3" Font-Names="Arial" GroupName="A" />
                            <asp:RadioButton ID="RadioButton4" runat="server" Font-Bold="False" Text="4" Font-Names="Arial" GroupName="A" />
                            <asp:RadioButton ID="RadioButton5" runat="server" Font-Bold="False" Text="5" Font-Names="Arial" GroupName="A" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td class="auto-style2">
                            <asp:Button ID="btn_Submit" runat="server" Text="Post Comment" OnClick="btn_Submit_Click" CssClass="buttonSubmit" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <h4 style="text-decoration: underline;">Comments:</h4>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="commentbox">
                        <b>
                        <%-- <asp:Label ID="Label1" runat="server" Text='<%#Eval("created_at") %>'>'></asp:Label>
                        </b>&nbsp;(<asp:Label ID="Label2" runat="server" Text='<%#Eval("book_code") %>'>'></asp:Label>)<br /> --%>
                        <br/><asp:Label ID="Label3" runat="server" Text='<%#Eval("text") %>'></asp:Label><br />
                        <br/><asp:Label ID="Label7" runat="server" Text="Rating : "></asp:Label>
                        <asp:Label ID="Label8" runat="server" Text='<%#Eval("rate") %>'></asp:Label><br />
                        <br/>
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
        </div>
    </form>
</body>
<asp:sqldatasource runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="SELECT * FROM [comment]"></asp:sqldatasource>
</html>
