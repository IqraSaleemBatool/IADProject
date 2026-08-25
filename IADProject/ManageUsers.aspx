<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="ManageUsers.aspx.cs"
Inherits="PVFC.ManageUsers" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Manage Users</title>

    <style>

        body {
            font-family: Arial;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 95%;
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

    <h2>Manage Users</h2>

    <asp:GridView ID="gvUsers"
        runat="server"
        CssClass="grid"
        AutoGenerateColumns="False"
        OnRowCommand="gvUsers_RowCommand"
        DataKeyNames="UserID">

        <Columns>

            <asp:BoundField DataField="UserID" HeaderText="ID" />
            <asp:BoundField DataField="FullName" HeaderText="Name" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" />
            <asp:BoundField DataField="RoleName" HeaderText="Role" />
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