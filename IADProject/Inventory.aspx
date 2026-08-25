<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="Inventory.aspx.cs"
Inherits="PVFC.Inventory" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Inventory Management</title>

    <style>

        body {
            font-family: Arial;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 40px auto;
            background: white;
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

        .grid input[type=text] {
            width: 80px;
            padding: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .grid a {
            text-decoration: none;
            color: white;
            background-color: #222;
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

    <h2>Inventory Management</h2>

    <asp:GridView ID="gvInventory"
        runat="server"
        CssClass="grid"
        AutoGenerateColumns="False"
        AutoGenerateEditButton="True"
        OnRowEditing="gvInventory_RowEditing"
        OnRowCancelingEdit="gvInventory_RowCancelingEdit"
        OnRowUpdating="gvInventory_RowUpdating">

        <Columns>

            <asp:BoundField DataField="ProductID"
                HeaderText="ID"
                ReadOnly="True" />

            <asp:BoundField DataField="ProductName"
                HeaderText="Product Name"
                ReadOnly="True" />

            <asp:BoundField DataField="StockQuantity"
                HeaderText="Stock" />

        </Columns>

    </asp:GridView>

    <a href="Dashboard.aspx" class="back-btn">
        Back To Dashboard
    </a>

</div>

</form>

</body>
</html>