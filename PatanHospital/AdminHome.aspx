<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="PatanHospital.AdminHome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 800px;
        }
        .style2
        {
            width: 154px;
        }
        .style3
        {
            width: 202px;
        }
        .style4
        {
            width: 24px;
        }
        .auto-style1
        {
            width: 154px;
            height: 14px;
        }
        .auto-style2
        {
            width: 24px;
            height: 14px;
        }
        .auto-style3
        {
            width: 202px;
            height: 14px;
        }
        .auto-style4
        {
            height: 14px;
        }
        .auto-style5
        {
            width: 154px;
            height: 34px;
        }
        .auto-style6
        {
            width: 24px;
            height: 34px;
        }
        .auto-style7
        {
            width: 202px;
            height: 34px;
        }
        .auto-style8
        {
            height: 34px;
        }
    </style>
</head>
<body bgcolor=#25272A>
    <form id="form1" runat="server">
    <div align="center">
        <div style="height:130px;">
                <asp:ImageButton ID="ImageButton1" OnClick="Logo_Click" OnClientClick="Logo_Click" ImageUrl="Images/PatanHospitalLogoPH.png" runat="server" style="height: 174px; width: 499px; margin-top:20px;" />
        </div>
        <div align="center"  style="font-size:large; font-weight:bold;margin-top:40px;">
            <h1 style="color:white;">Administrator</h1>
        </div>
        <div align="center" style="text-align: center; margin-bottom:10px;">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Login.aspx">Log Out</asp:HyperLink>
        </div>

        <div style="width:33%; display:inline-block;">
            <h2 style="color:#23d6d0;">Patients</h2>
            
        </div>
        <div style="width:33%; display:inline-block;">
            <h2 style="color:#23d6d0;">Doctors</h2>
           
        </div>
        <div style="width:33%; display:inline-block;">
            <h2 style="color:#23d6d0">Schedules</h2>
        </div>
        <div style="width:33%;display:inline-block;">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                        Text="Register a Patient" Width="175px" Height="30px" style="font-weight: 700" />
            <asp:Button ID="Button5" runat="server" Text="Edit Patient Information" 
                        Width="175px" onclick="Button5_Click" Height="30px" style="font-weight: 700" />
            <asp:Button ID="Button12" runat="server" Text="Delete Patients" 
                        onclick="Button12_Click" Height="30px" style="font-weight: 700" Width="175px" />
        </div>
        <div style="width:33%; display:inline-block; padding-top:20px">
             <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                        Text="Register a Doctor" Width="175px" Height="30px" style="font-weight: 700" />
            <asp:Button ID="Button7" runat="server" onclick="Button7_Click" 
                        Text="Edit Doctor Information" Width="175px" Height="30px" style="font-weight: 700" />
            <asp:Button ID="Button13" runat="server" Text="Delete Doctor" 
                        onclick="Button13_Click" Height="30px" style="font-weight: 700" Width="175px" />
            <asp:Button ID="Button8" runat="server" Text="Search Doctor" OnClick="Button8_Click" Height="30px" style="font-weight: 700" Width="175px" />
        </div>
        <div style="width:33%; display:inline-block;">
            <asp:Button ID="Button9" runat="server" Text="Schedule Appointments" 
                        onclick="Button9_Click" Height="30px" style="font-weight: 700" Width="175px" />
            <asp:Button ID="Button11" runat="server" Text="Delete Appointments" OnClick="Button11_Click" Height="30px" style="font-weight: 700" Width="175px" />

        </div>
    </div>
    </form>
</body>
</html>
