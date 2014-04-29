<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePassword.aspx.cs" Inherits="PatanHospital.UpdatePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 400px;
        }
        .auto-style4
        {
            width: 183px;
            text-align: right;
            color:#23d6d0;
        }
        .auto-style6
        {
            width: 183px;
            height: 23px;
            text-align: right;
        }
        .auto-style7
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
            <h1 style="color:white;">Update Password</h1>
        </div>
    
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">
                    <asp:RadioButton ID="RadioButton3" runat="server" GroupName="Valid"  style="font-weight: 700" Text="Doctor" ForeColor="White" />
                </td>
                <td>
                    <asp:RadioButton ID="RadioButton4" runat="server" GroupName="Valid"  style="font-weight: 700" Text="Patient" ForeColor="White" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label2" runat="server" style="font-weight: 700; text-align: right;" Text="Email:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Height="20px" Width="160px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label3" runat="server" style="font-weight: 700" Text="Old Password:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Height="20px" Width="160px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label4" runat="server" style="font-weight: 700" Text="New Password:"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" Height="20px" Width="160px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label5" runat="server" style="font-weight: 700" Text="Re type New Password:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" Height="20px" Width="160px"></asp:TextBox>
                </td>
            </tr>
            </table>
        <div style="display:inline;">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="font-weight: 700" Text="Update" Height="30px" Width="160px" />
        </div>
        <div style="display:inline; margin-left:10px;">
            <asp:Button ID="Button2" runat="server" OnClick="Logo_Click" style="font-weight: 700; margin-top: 0px;" Text="Cancel" Height="30px" Width="160px" />
        </div>
        </div>
    </form>
</body>
</html>
