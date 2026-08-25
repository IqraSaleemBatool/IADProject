<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="Orders.aspx.cs"
Inherits="PVFC.Orders" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>My Orders</title>

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

        .grid {
            width: 100%;
            border-collapse: collapse;
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

    <h2>My Orders</h2>

    <asp:GridView ID="gvOrders"
        runat="server"
        CssClass="grid"
        AutoGenerateColumns="False">

        <Columns>

            <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
            <asp:BoundField DataField="OrderDate" HeaderText="Date" />
           <asp:BoundField DataField="ProductName" HeaderText="Product" />
           <asp:BoundField DataField="Quantity" HeaderText="Qty" />
           <asp:BoundField DataField="Total" HeaderText="Total" />
            <asp:BoundField DataField="Status" HeaderText="Status" />

        </Columns>

    </asp:GridView>

    <a href="Dashboard.aspx" class="back-btn">
        Back To Dashboard
    </a>

</div>

</form>

</body>
</html>