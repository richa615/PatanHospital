<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorProfile.aspx.cs" Inherits="PatanHospital.DoctorProfile" %>

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
            width: 142px;
        }
        .auto-style3
        {
            width: 142px;
            font-weight: bold;
            color:#23d6d0;
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
            <h1 style="color:white;">Doctor Profile</h1>
        </div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Name:</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">SSN:</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Phone:</td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Email:</td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Education:</td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Residency:</td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Gender</td>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">NPI</td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Date of Graduation:</td>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Speciality:</td>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Address1:</td>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">City:</td>
                <td>
                    <asp:Label ID="Label13" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">State:</td>
                <td>
                    <asp:Label ID="Label14" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Zip Code:</td>
                <td>
                    <asp:Label ID="Label15" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="font-weight: 700" Text="Done" Height="30px" Width="150px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
