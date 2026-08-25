<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="PVFC.Cart" %>

<!DOCTYPE html>
<html>
<head runat="server">
<title>My Cart</title>

<style>
body{font-family:Arial;background:#f4f4f4;}
.container{width:80%;margin:40px auto;background:white;padding:25px;border-radius:10px;}
.grid{width:100%;border-collapse:collapse;}
.grid th{background:black;color:white;padding:10px;}
.grid td{padding:10px;border:1px solid #ccc;text-align:center;}
.btn{background:black;color:white;padding:10px;border:none;border-radius:5px;}
</style>

</head>

<body>
<form runat="server">
<div class="container">

<h2>My Cart</h2>
    <asp:Label ID="lblMessage" runat="server" 
ForeColor="Green" Font-Bold="true"></asp:Label>
<br />

<asp:GridView ID="gvCart" runat="server" CssClass="grid" AutoGenerateColumns="False">
<Columns>
<asp:BoundField DataField="ProductName" HeaderText="Product" />
<asp:BoundField DataField="Price" HeaderText="Price" />
<asp:BoundField DataField="Quantity" HeaderText="Qty" />
<asp:BoundField DataField="Total" HeaderText="Total" />
</Columns>
</asp:GridView>

<br />

<asp:Label ID="lblTotal" runat="server" Font-Bold="true"></asp:Label>

<br /><br />

<h3>Recommended Products</h3>

<asp:GridView ID="gvRecommendation" runat="server" CssClass="grid" AutoGenerateColumns="False">
<Columns>
<asp:BoundField DataField="ProductName" HeaderText="Product" />
<asp:BoundField DataField="Price" HeaderText="Price" />
<asp:BoundField DataField="CategoryName" HeaderText="Category" />
</Columns>
</asp:GridView>

<br /><br />

Payment:
<asp:DropDownList ID="ddlPayment" runat="server">
    <asp:ListItem>Cash On Delivery</asp:ListItem>
    <asp:ListItem>Card</asp:ListItem>
    <asp:ListItem>JazzCash</asp:ListItem>
</asp:DropDownList>

<br /><br />

<asp:Button ID="btnOrder" runat="server" Text="Place Order" CssClass="btn" OnClick="btnOrder_Click" />
    <br /><br />
<asp:Button ID="btnshop" runat="server" Text="Continue Shopping" CssClass="btn" PostBackUrl="Products.aspx" />
    <br /><br />
    <asp:Button ID="Button1" runat="server" Text="Back To Dashboard" CssClass="btn" PostBackUrl="Dashboard.aspx" />
</div>
</form>
</body>
</html>