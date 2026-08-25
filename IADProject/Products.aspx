<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="Products.aspx.cs"
Inherits="PVFC.Products" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Products</title>

    <style>

        body {
            font-family: Arial;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 85%;
            margin: 40px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #ccc;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        input[type=text] {
            padding: 10px;
            width: 220px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type=submit] {
            background: black;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        .grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .grid th {
            background-color: black;
            color: white;
            padding: 12px;
        }

        .grid td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        .grid tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .grid a {
            text-decoration: none;
            background: #222;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .cart-btn {
            display: inline-block;
            margin-top: 20px;
            background: black;
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
        }
        .back-btn {
            display: inline-block;
            margin-top: 20px;
            background: black;
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
        }
 
    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

    <h2>Available Abayas</h2>

    Search Product:

    <asp:TextBox ID="txtSearch"
        runat="server"></asp:TextBox>

    <asp:Button ID="btnSearch"
        runat="server"
        Text="Search"
        OnClick="btnSearch_Click" />

    <asp:GridView ID="gvProducts"
        runat="server"
        CssClass="grid"
        AutoGenerateColumns="False"
        AutoGenerateSelectButton="True"
        OnSelectedIndexChanged="gvProducts_SelectedIndexChanged">

        <Columns>

            <asp:BoundField DataField="ProductID" HeaderText="ID" />
            <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" />
            <asp:BoundField DataField="StockQuantity" HeaderText="Stock" />

        </Columns>

    </asp:GridView>

    <a href="Cart.aspx" class="cart-btn">
        Go To Cart
    </a>
    <a href="Dashboard.aspx" class="back-btn">
    Back To Dashboard
</a>
</div>

</form>

</body>
</html>