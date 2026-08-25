<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="DemandForecast.aspx.cs"
Inherits="PVFC.DemandForecast" %>

<!DOCTYPE html>

<html>
<head runat="server">

<title>Demand Forecast</title>

<style>

body{
    font-family:Arial;
    background:#f4f4f4;
}

.container{
    width:80%;
    margin:auto;
    background:white;
    padding:20px;
    margin-top:30px;
    border-radius:8px;
}

h2{
    text-align:center;
}

.grid{
    width:100%;
}
.btn{
    background:black;
    color:white;
    padding:10px;
    border:none;
    border-radius:5px;

}

</style>

</head>

<body>

<form runat="server">

<div class="container">

<h2>Demand Forecast Report</h2>

<asp:GridView ID="gvForecast"
runat="server"
CssClass="grid">
</asp:GridView>

<br />

<asp:Button ID="btnBack"
runat="server"
Text="Back To Dashboard"
CssClass="btn"
PostBackUrl="Dashboard.aspx" />

</div>

</form>

</body>
</html>