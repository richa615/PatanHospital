﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorHome.aspx.cs" Inherits="PatanHospital.DoctorHome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 800px;
        }
        .auto-style2
        {
            width: 616px;
        }
    </style>
</head>
<body bgcolor=#25272A>
    <form id="form1" runat="server">
    
    <div align="center">
        <div style="height:130px;">
            <img src="Images/PatanHospitalLogoPH.png" style="height: 174px; width: 499px; margin-top:20px;" />
        </div>
        <div align="center"  style="font-size:large; font-weight:bold;margin-top:40px;">
            <h1 style="color:white;">Doctor</h1>
        </div>
        <div style="padding:10px;">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Log Out</asp:HyperLink>
        </div>
        <div style="width:201px; height: 93px; background-color:#25272A;">
            <div style="padding:10px;">
                <asp:Button ID="Button4" runat="server" OnClick="Button2_Click" style="font-weight: 700;" Text="View Profile" Height="30px" Width="160px" />
            </div>
            <div>
                <asp:Button ID="Button6" runat="server" style="font-weight: 700" Text="View Schedule" OnClick="Button6_Click" Height="30px" Width="160px" />
            </div>   
        </div>
         

    </div>
    </form>
</body>
</html>
