<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientProfile.aspx.cs" Inherits="PatanHospital.PatientProfile" %>

<!DOCTYPE html>

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
            width: 145px;
        }
        .auto-style3
        {
            width: 145px;
            font-weight: bold;
        }
        .auto-style4
        {
            width: 216px;
        }
        .auto-style5
        {
            width: 278px;
        }
    </style>
</head>
<body bgcolor=#BDBDBD>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="font-weight: 700" Text="Home" Height="30px" Width="160px" />
                </td>
                <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                <td>&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx" style="text-align: right">Log Out</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Name:</td>
                <td colspan="2">
                    <asp:Label ID="Label2" runat="server" Text="Label" style="font-weight: 700"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">SSN:</td>
                <td colspan="2">
                    <asp:Label ID="Label3" runat="server" Text="Label" style="font-weight: 700"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Gender:</td>
                <td colspan="2">
                    <asp:Label ID="Label4" runat="server" Text="Label" style="font-weight: 700"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Address1:</td>
                <td colspan="2">
                    <asp:Label ID="Label5" runat="server" Text="Label" style="font-weight: 700"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Address2:</td>
                <td colspan="2">
                    <asp:Label ID="Label6" runat="server" Text="Label" style="font-weight: 700"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">City:</td>
                <td colspan="2">
                    <asp:Label ID="Label7" runat="server" Text="Label" style="font-weight: 700"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">State:</td>
                <td colspan="2">
                    <asp:Label ID="Label8" runat="server" Text="Label" style="font-weight: 700"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Zip code:</td>
                <td colspan="2">
                    <asp:Label ID="Label9" runat="server" Text="Label" style="font-weight: 700"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Phone:</td>
                <td colspan="2">
                    <asp:Label ID="Label10" runat="server" Text="Label" style="font-weight: 700"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Email Address:</td>
                <td colspan="2">
                    <asp:Label ID="Label11" runat="server" Text="Label" style="font-weight: 700"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td colspan="2">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="font-weight: 700" Text="Done" Height="30px" Width="160px" />
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
