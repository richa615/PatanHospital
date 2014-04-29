<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientHome.aspx.cs" Inherits="PatanHospital.PatientHome" %>

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
            height: 23px;
        }
        .auto-style3
        {
            width: 207px;
        }
        .auto-style4
        {
            height: 23px;
            width: 207px;
        }
        .auto-style5
        {
            width: 196px;
        }
        .auto-style6
        {
            height: 23px;
            width: 196px;
        }
        .auto-style7
        {
            width: 207px;
            height: 35px;
        }
        .auto-style8
        {
            width: 196px;
            height: 35px;
        }
        .auto-style9
        {
            height: 35px;
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
                <h1 style="color:white;">Patient</h1>
            </div>
             <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Login.aspx">Log Out</asp:HyperLink>
            <table>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" style="font-weight: 700" Text="View Profile" OnClick="Button1_Click" Height="30px" Width="160px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button2" runat="server" style="font-weight: 700" Text="Search For Doctor" OnClick="Button2_Click" Height="30px" Width="160px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button3" runat="server" style="font-weight: 700" Text="Reserve Appointments" OnClick="Button3_Click" Height="30px" Width="160px" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
    </body>
</html>
