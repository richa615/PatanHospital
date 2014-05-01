<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeletePatient.aspx.cs" Inherits="PatanHospital.DeletePatient" %>

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
            width: 109px;
            color:#23d6d0;
        }
        .style3
        {
            color:#23d6d0;
            width: 268px;
        }
        .style4
        {
            color:#23d6d0;
            width: 88px;
        }
        .auto-style1 {
            color: #23d6d0;
            width: 88px;
            height: 30px;
        }
        .auto-style2 {
            height: 30px;
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
            <h1 style="color:white;">Delete Patient</h1>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Log Out</asp:HyperLink>
        <div>
            <strong class=auto-style1>Patient Name:</strong>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="SSN" 
                Height="30px" Width="160px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:HospitalServerConnectionString %>" 
                SelectCommand="SELECT Fname + ' ' + Lname AS Name, SSN FROM PatientCredientials">
            </asp:SqlDataSource>
            <asp:Button ID="Button3" runat="server" Text="Delete" onclick="Button3_Click" Height="30px" style="font-weight: 700" Width="160px" />
        </div>
        <div style="margin-top:10px;">
            <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="White"></asp:Label>
        </div>
        <table class="style1">
        </table>
        <table id ="table2" runat="server">
            <tr>
                <td class="auto-style1">
                    <strong>Name:</strong></td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox1" runat="server" Height="20px" Width="160px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    <strong>SSN:</strong></td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Height="20px" Width="160px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    <strong>Phone:</strong></td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Height="20px" Width="160px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <strong>Email:</strong></td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox4" runat="server" Height="20px" Width="160px"></asp:TextBox>
                </td>
            </tr>
         </table>
        <div>
            <asp:Button ID="Button4" runat="server" onclick="Button1_Click" 
                    Text="Confirm Deletion" Height="30px" style="font-weight: 700" Width="160px" />
            <asp:Button ID="Button5" runat="server" Text="Cancel" onclick="Logo_Click" Height="30px" style="font-weight: 700; margin-left:5px;" Width="160px" />
        </div>
           
    </div>
    </form>
</body>
</html>
