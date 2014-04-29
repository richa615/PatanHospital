<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientProfile.aspx.cs" Inherits="PatanHospital.PatientProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style3
        {
            width: 145px;
            font-weight: bold;
            color: #23d6d0;
        }
        .auto-style4
        {
            color:white;
            width: 216px;
        }
        .auto-style6 {
            width: 145px;
            font-weight: bold;
            color: #23d6d0;
            height: 23px;
        }
        .auto-style7 {
            height: 23px;
        }
    </style>
</head>
<body bgcolor=#25272A>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <div align="center">
        <div style="height:130px;">
            <asp:ImageButton ID="ImageButton1" OnClick="Logo_Click" OnClientClick="Logo_Click" ImageUrl="Images/PatanHospitalLogoPH.png" runat="server" style="height: 174px; width: 499px; margin-top:20px;" />
        </div>
        <div align="center"  style="font-size:large; font-weight:bold;margin-top:40px;">
            <h1 style="color:white;">Patient Profile</h1>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx" style="text-align: right">Log Out</asp:HyperLink>
        <table>
            <tr>
                <td class="auto-style3">
                    Name:
                </td>
                <td class="auto-style4">
                    <asp:Label ID="Label2" runat="server" Text="Label" style="font-weight: 700"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    SSN:
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    Gender: 
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    Address1: 
                </td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    Address2:
                </td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    City:
                </td>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    State:
                </td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    Zip Code:
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label9" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    Phone:
                </td>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
               <td class="auto-style3">
                    Email Address:
                </td>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
        </table>
        <div style="display:inline-block;">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="font-weight: 700" Text="Done" Height="30px" Width="160px" />
        </div>
    </div>
    </form>
</body>
</html>
