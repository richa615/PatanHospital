<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="PatanHospital._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>CasCading Dropdowns Sample</title>
</head>
<body>
<form id="form1" runat="server">
<div>
<table align="center">
<Select Country:
</td>
<td>
<asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="true"
onselectedindexchanged="ddlCountry_SelectedIndexChanged"></asp:DropDownList>
</td>
</tr>
<tr>
<td>
Select State:
ct State:
</td>
<td>
<asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true"
onselectedindexchanged="ddlState_SelectedIndexChanged"></asp:DropDownList>
</td>
</tr>
<tr>
<td>
Select Region:
</td>
<td>
<asp:DropDownList ID="ddlRegion" runat="server"></asp:DropDownList>
</td>
</tr>
</table>
</div>
</form>
</body>
</html>
</asp:Content>
