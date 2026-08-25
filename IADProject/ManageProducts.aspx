<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="ManageProducts.aspx.cs"
Inherits="PVFC.ManageProducts" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Manage Products</title>

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
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type=submit] {
            background-color: black;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background-color: #444;
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

    <h2>Manage Products</h2>

    <asp:TextBox ID="txtName"
        runat="server"
        placeholder="Product Name"></asp:TextBox>

    <asp:TextBox ID="txtPrice"
        runat="server"
        placeholder="Price"></asp:TextBox>

    <asp:TextBox ID="txtStock"
        runat="server"
        placeholder="Stock"></asp:TextBox>

    <asp:Button ID="btnAdd"
        runat="server"
        Text="Add Product"
        OnClick="btnAdd_Click" />

    <asp:GridView ID="gvProducts"
        runat="server"
        CssClass="grid"
        AutoGenerateColumns="False"
      DataKeyNames="ProductID"
       OnRowCommand="gvProducts_RowCommand">

        <Columns>

            <asp:BoundField DataField="ProductID" HeaderText="ID" />
            <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" />
            <asp:BoundField DataField="StockQuantity" HeaderText="Stock" />
            <asp:BoundField DataField="IsActive" HeaderText="Status" />

               <asp:ButtonField Text="Deactivate" CommandName="Deactivate" />
              <asp:ButtonField Text="Activate" CommandName="Activate" />
        </Columns>

    </asp:GridView>

    <a href="Dashboard.aspx" class="back-btn">
        Back To Dashboard
    </a>

</div>

</form>

</body>
</html>