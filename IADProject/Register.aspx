<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="Register.aspx.cs"
Inherits="PVFC.Register" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Register</title>

    <style>

        body {
            font-family: Arial;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 40%;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #ccc;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        .textbox {
            width: 95%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn {
            background-color: black;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #444;
        }

        .login-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: black;
            font-weight: bold;
        }

        .message {
            color: green;
            font-weight: bold;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

    <h2>Customer Registration</h2>

    Name:
    <asp:TextBox ID="txtName"
        runat="server"
        CssClass="textbox"></asp:TextBox>

    Email:
    <asp:TextBox ID="txtEmail"
        runat="server"
        CssClass="textbox"></asp:TextBox>

    Password:
    <asp:TextBox ID="txtPassword"
        runat="server"
        TextMode="Password"
        CssClass="textbox"></asp:TextBox>

    Phone:
    <asp:TextBox ID="txtPhone"
        runat="server"
        CssClass="textbox"></asp:TextBox>

    Address:
    <asp:TextBox ID="txtAddress"
        runat="server"
        CssClass="textbox"></asp:TextBox>

    <asp:Button ID="btnRegister"
        runat="server"
        Text="Register"
        CssClass="btn"
        OnClick="btnRegister_Click" />

    <br /><br />

    <asp:Label ID="lblMessage"
        runat="server"
        CssClass="message"></asp:Label>

    <br />

    <a href="Login.aspx" class="login-link">
        Back To Login
    </a>

</div>

</form>

</body>
</html>