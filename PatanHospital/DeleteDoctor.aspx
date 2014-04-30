<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteDoctor.aspx.cs" Inherits="PatanHospital.DeleteDoctor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 500px;
        }
        .style2
        {
            width: 200px;
            color:#23d6d0;
        }
        .style3
        {
            width: 79px;
        }
        .auto-style4 {
            width: 12px;
        }
    </style>
</head>
<body bgcolor=#25272A>
    <form id="form1" runat="server">
    <div align="center">
        <div style="height:130px;">
            <asp:ImageButton OnClick="Logo_Click" OnClientClick="Logo_Click" ImageUrl="Images/PatanHospitalLogoPH.png" runat="server" style="height: 174px; width: 499px; margin-top:20px;" />
        </div>
        <div align="center"  style="font-size:large; font-weight:bold;margin-top:40px;">
            <h1 style="color:white;">Delete Doctor</h1>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Log Out</asp:HyperLink>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="White"></asp:Label>
        </div>
        <table id="Table1" class="style1">
            <tr>
                <td class="style2">
                    <strong>Name:</strong></td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="SSN" Height="30px" Width="160px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HospitalServerConnectionString %>" 
                        SelectCommand="SELECT Fname + ' ' + Lname AS Name, SSN FROM DoctorCrediantials">
                    </asp:SqlDataSource>
                </td>
            </tr>
            </table>
        <div style="display:inline;">
            <asp:Button ID="Button1" runat="server" Text="Delete" onclick="Button1_Click" Height="30px" style="font-weight: 700" Width="150px" />
        </div>
        <div style="display:inline; margin-left:10px;">
            <asp:Button ID="Button2" runat="server" Text="Cancel" onclick="Logo_Click" Height="30px" style="font-weight: 700" Width="150px" />
        </div>
        <table id="Table2" class="style1" runat ="server" align="center">
        <tr>
            <td class="style2">
                <strong>Name:</strong></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Height="20px" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <strong>SSN:</strong></td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Height="20px" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <strong>Phone:</strong></td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Height="20px" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <strong>Email:</strong></td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" Height="20px" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
            <asp:Button ID="Button3" runat="server" Text="Confirm Deletion" 
                    onclick="Button3_Click" Height="30px" style="font-weight: 700" Width="150px" />
            </td>
            <td>
            <asp:Button ID="Button4" runat="server" onclick="Logo_Click" Text="Cancel" Height="30px" style="font-weight: 700" Width="150px" />
            </td>
        </tr>
        </table>
        <div style="display:inline;">
        </div>
        <div style="display:inline; margin-left:10px;">
        </div>
    </div>
    
    </form>
    </body>
</html>
