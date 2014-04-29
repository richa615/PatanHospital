<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="PatanHospital.ForgotPassword" %>

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
            width: 119px;
        }
        .style3
        {
            width: 68px;
        }
        .style4
        {
            width: 119px;
            height: 23px;
        }
        .style5
        {
            width: 68px;
            height: 23px;
        }
        .style6
        {
            height: 23px;
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
            <h1 style="color:white;">Forgot Password</h1>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Go back</asp:HyperLink>
        <div style="padding-top:5px;">
             <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="White"></asp:Label>
        </div>
        <table>
            <tr>
                <td style="color:#23d6d0;">
                    <strong>Email:</strong>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div style="display:inline-block; padding-top:10px;">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" Height="30px" style="font-weight: 700" Width="160px" />
        </div>
        <div style="display:inline-block">
            <asp:Button ID="Button2" runat="server" onclick="Logo_Click" Text="Cancel" Height="30px" style="font-weight: 700" Width="160px" />
        </div>
        <div>
            <asp:Label ID="Label2" runat="server" Text="Label" ForeColor="White"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
