<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Admin_Logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Logout</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        .Absolute-Center {
            margin: auto;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
        }

            .Absolute-Center.is-Responsive {
                width: 50%;
                height: 50%;
            }
    </style>

</head>
<body>
    <form id="form1" runat="server" class="w-100 h-100 container">
        <div class="row w-100 h-100 justify-content-center">
            <div class="Absolute-Center is-Responsive">
                <div class="row w-100">
                    <div class="">
                        <asp:Label ID="Label" runat="server" Text="Username " CssClass="h1"></asp:Label>
                        <asp:Label ID="LabelUname" runat="server" Text="Username" CssClass="h1 text-danger"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text="ได้ออกจากระบบเเล้ว" CssClass="h1"></asp:Label>

                        <hr />
                        <div class="row justify-content-between">

                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-success mx-5" NavigateUrl="~/Admin/Login.aspx">เข้าสู่ระบบใหม่</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="btn btn-danger mx-5" NavigateUrl="~/Customer/Home.aspx">กลับหน้าของผู้ใช้</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
