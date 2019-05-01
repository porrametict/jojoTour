<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
                min-width: 200px;
                max-width: 400px;
                padding: 40px;
            }
    </style>

</head>
<body style="background-image:url('http://chalounsukcredit.com/wp-content/uploads/2018/09/bg-trouglovi2.jpg')">
    <form id="form1" runat="server" class="w-100 h-100 container">
        <div class="row w-100 h-100 ">
            <div class="Absolute-Center is-Responsive">
                   <div class="row w-100 justify-content-center align-items-center">
                <div class="card">
                    <div class=" text-danger card-header">
                        <h5 class="">Login</h5>

                    </div>
                    <div class=" card-body">
                        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                        <asp:TextBox ID="TextBoxUsername" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUname" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" ForeColor="#FF3300" ControlToValidate="TextBoxUsername" SetFocusOnError="True" CssClass="mb-2">กรุณากรอกช่องนี้</asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="TextBoxPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" ForeColor="#FF3300" ControlToValidate="TextBoxPassword" SetFocusOnError="True">กรุณากรอกช่องนี้</asp:RequiredFieldValidator>

                        <br />
                        <asp:Button ID="ButtonLogin" runat="server" CssClass="btn btn-danger btn-block" Text="Login" OnClick="ButtonLogin_Click" />


                    </div>

                </div>
            </div>
            </div>
         
        </div>
    </form>
</body>
</html>
