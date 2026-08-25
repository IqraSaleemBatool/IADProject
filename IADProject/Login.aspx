<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PVFC.Login" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Login</title>

    <style>

        body {
            font-family: Arial;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 60px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #ccc;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 25px;
        }

        .textbox {
            width: 90%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            background-color: black;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }

        .btn:hover {
            background-color: #444;
        }

        .message {
            color: red;
            font-weight: bold;
        }

        .demo-box {
            margin-top: 25px;
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .demo-box h3 {
            margin-top: 0;
            color: #222;
        }

        .register-link {
            margin-top: 20px;
        }

        .register-link a {
            text-decoration: none;
            color: black;
            font-weight: bold;
        }

        .register-link a:hover {
            color: #666;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <div class="container">

        <h2>Ivory Haya Login</h2>

        <p>Email</p>

        <asp:TextBox ID="txtEmail"
            runat="server"
            CssClass="textbox">
        </asp:TextBox>

        <br /><br />

        <p>Password</p>

        <asp:TextBox ID="txtPassword"
            runat="server"
            TextMode="Password"
            CssClass="textbox">
        </asp:TextBox>

        <br /><br />

        <asp:Button ID="btnLogin"
            runat="server"
            Text="Login"
            CssClass="btn"
            OnClick="btnLogin_Click" />

        <br /><br />

        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>

        <!-- DEMO ACCOUNTS -->

        <div class="demo-box">

            <h3>Demo Accounts</h3>

            <b>Admin</b><br />
            Email: admin@gmail.com<br />
            Password: admin123

            <br /><br />

            <b>Sales Person</b><br />
            Email: sales@gmail.com<br />
            Password: sales123

            <br /><br />

            <b>Customer</b><br />
            Email: ayesha@gmail.com<br />
            Password: 123

        </div>

        <!-- REGISTER LINK -->

        <div class="register-link">

            New User?
            <a href="Register.aspx">Register Here</a>

        </div>

    </div>

</form>

</body>
</html>