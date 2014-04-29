<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditPatient.aspx.cs" Inherits="PatanHospital.EditPatient" %>

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
            font-size: large;
        }
        .style3
        {
        }
        .style4
        {
            width: 207px;
        }
        .style5
        {
            width: 89px;
        }
        .style6
        {
        }
        .auto-style1
        {
            font-weight: bold;
            color:#23d6d0;
        }
        .auto-style2
        {
            width: 89px;
            font-weight: bold;
            color:#23d6d0;
        }
        .auto-style3
        {
            height: 34px;
        }
        .auto-style4
        {
            width: 207px;
            height: 34px;
        }
        .auto-style5
        {
            width: 89px;
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
            <h1 style="color:white;">Edit Patient Information</h1>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Log Out</asp:HyperLink>
        <table class="style1">
            <tr>
                <td class="style3" colspan="4">
                    <strong style="color:#23d6d0;">Name:</strong><asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="SSN" 
                        Height="30px" Width="160px" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HospitalServerConnectionString %>" 
                   
                        
                        SelectCommand="SELECT Fname + ' ' + Lname AS Name, SSN FROM PatientCredientials">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style6" colspan="4">
                    <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    First Name:</td>
                <td class="style4">
                    <asp:TextBox ID="TextBox1" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    Last Name:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    SSN:</td>
                <td class="style4">
                    <asp:TextBox ID="TextBox3" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    Gender:</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    Address1:</td>
                <td class="style4">
                    <asp:TextBox ID="TextBox5" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    Address2:</td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    City</td>
                <td class="style4">
                    <asp:TextBox ID="TextBox7" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    State:</td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    Zip Code:</td>
                <td class="style4">
                    <asp:TextBox ID="TextBox9" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    Phone:</td>
                <td>
                    <asp:TextBox ID="TextBox10" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    Email:</td>
                <td class="style4">
                    <asp:TextBox ID="TextBox11" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
                <td class="style5">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    </td>
                <td class="auto-style4">
                    <asp:Button ID="Button1" runat="server" Height="30px" onclick="Button1_Click" 
                        Text="Update" Width="160px" style="font-weight: 700" />
                </td>
                <td class="auto-style5">
                    <asp:Button ID="Button2" runat="server" Height="30px" onclick="Logo_Click" 
                        Text="Cancel" Width="160px" CausesValidation="False" style="font-weight: 700" />
                </td>
                <td class="auto-style3">
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
