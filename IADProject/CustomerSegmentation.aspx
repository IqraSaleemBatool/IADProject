<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="CustomerSegmentation.aspx.cs"
Inherits="PVFC.CustomerSegmentation" %>

<!DOCTYPE html>

<html>
<head runat="server">

<title>Customer Segmentation</title>

<style>

body{
    font-family:Arial;
    background:#f4f4f4;
    margin:0;
    padding:20px;
}

.container{
    width:90%;
    margin:auto;
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0px 0px 10px #ccc;
}

h2{
    text-align:center;
    color:#333;
}

h3{
    background:black;
    color:white;
    padding:10px;
    border-radius:5px;
}

.grid{
    width:100%;
    border-collapse:collapse;
    margin-bottom:10px;
}

.grid th{
    background:#222;
    color:white;
    padding:10px;
}

.grid td{
    border:1px solid #ccc;
    padding:8px;
}

.btn{
    padding:8px 15px;
    background:black;
    color:white;
    border:none;
    border-radius:5px;
    cursor:pointer;
}

.btn:hover{
    background:#444;
}

.msg{
    font-weight:bold;
    color:green;
}

.back-btn{
    background:#666;
}

.back-btn:hover{
    background:#333;
}

</style>

</head>

<body>

<form runat="server">

<div class="container">

<h2>Customer Segmentation & Marketing</h2>

<asp:Button ID="btnRefresh"
runat="server"
Text="Refresh Data"
CssClass="btn"
OnClick="btnRefresh_Click" />

<br /><br />

<h3>Premium Customers</h3>

<asp:GridView ID="gvPremium"
runat="server"
CssClass="grid"></asp:GridView>

<asp:Button ID="btnPremium"
runat="server"
Text="Send Offer"
CssClass="btn"
OnClick="btnPremium_Click" />

<asp:Label ID="lblPremium"
runat="server"
CssClass="msg"></asp:Label>

<br /><br />

<h3>Frequent Customers</h3>

<asp:GridView ID="gvFrequent"
runat="server"
CssClass="grid"></asp:GridView>

<asp:Button ID="btnFrequent"
runat="server"
Text="Send Offer"
CssClass="btn"
OnClick="btnFrequent_Click" />

<asp:Label ID="lblFrequent"
runat="server"
CssClass="msg"></asp:Label>

<br /><br />

<h3>Regular Customers</h3>

<asp:GridView ID="gvRegular"
runat="server"
CssClass="grid"></asp:GridView>

<asp:Button ID="btnRegular"
runat="server"
Text="Send Offer"
CssClass="btn"
OnClick="btnRegular_Click" />

<asp:Label ID="lblRegular"
runat="server"
CssClass="msg"></asp:Label>

<br /><br />

<h3>Occasional Customers</h3>

<asp:GridView ID="gvOccasional"
runat="server"
CssClass="grid"></asp:GridView>

<asp:Button ID="btnOccasional"
runat="server"
Text="Send Offer"
CssClass="btn"
OnClick="btnOccasional_Click" />

<asp:Label ID="lblOccasional"
runat="server"
CssClass="msg"></asp:Label>

<br /><br />

<h3>Budget Customers</h3>

<asp:GridView ID="gvBudget"
runat="server"
CssClass="grid"></asp:GridView>

<asp:Button ID="btnBudget"
runat="server"
Text="Send Offer"
CssClass="btn"
OnClick="btnBudget_Click" />

<asp:Label ID="lblBudget"
runat="server"
CssClass="msg"></asp:Label>

<br /><br />

<asp:Button ID="btnBack"
runat="server"
Text="Back To Dashboard"
CssClass="btn back-btn"
OnClick="btnBack_Click" />

</div>

</form>

</body>
</html>