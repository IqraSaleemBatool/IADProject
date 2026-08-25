<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="ManageOrders.aspx.cs"
Inherits="PVFC.ManageOrders" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Manage Orders</title>

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
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #ccc;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
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
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        .grid tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .grid a {
            text-decoration: none;
            background-color: #222;
            color: white;
            padding: 6px 10px;
            border-radius: 5px;
        }

        .grid a:hover {
            background-color: #555;
        }

        .back-btn {
            display: inline-block;
            margin-top: 25px;
            text-decoration: none;
            background-color: black;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
        }

        .back-btn:hover {
            background-color: #444;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

    <h2>Manage Orders</h2>

    <asp:GridView ID="gvOrders"
    runat="server"
    CssClass="grid"
    AutoGenerateColumns="False"
    DataKeyNames="OrderID"
    OnRowCommand="gvOrders_RowCommand">

    <Columns>

        <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
        <asp:BoundField DataField="UserID" HeaderText="User ID" />
        <asp:BoundField DataField="TotalAmount" HeaderText="Amount" />
        <asp:BoundField DataField="Status" HeaderText="Status" />
        <asp:BoundField DataField="PaymentMethod" HeaderText="Payment" />

        <asp:ButtonField ButtonType="Button"
            Text="Mark Completed"
            CommandName="Complete" />

    </Columns>
</asp:GridView>



    <a href="Dashboard.aspx" class="back-btn">
        Back To Dashboard
    </a>

</div>

</form>

</body>
</html>