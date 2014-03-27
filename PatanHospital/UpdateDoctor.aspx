<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateDoctor.aspx.cs" Inherits="PatanHospital.UpdateDoctor" %>

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
        }
        .style3
        {
            width: 196px;
        }
        .style4
        {
            width: 126px;
        }
        .style6
        {
            font-size: large;
        }
        .style7
        {
            width: 141px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2" colspan="4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6" colspan="4">
                    <strong>Edit Doctor Information</strong></td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    First Name:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox1" runat="server" Height="20px" Width="169px" 
                        AutoCompleteType="FirstName" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style4">
                    Last Name:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Height="20px" Width="169px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    SSN:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox3" runat="server" Height="20px" Width="169px"></asp:TextBox>
                </td>
                <td class="style4">
                    Phone Number:</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Height="20px" Width="169px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Gender:</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    Email:</td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" Height="20px" Width="169px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Address1:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox6" runat="server" Height="20px" Width="169px"></asp:TextBox>
                </td>
                <td class="style4">
                    Address2:</td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server" Height="20px" Width="169px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    City:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox8" runat="server" Height="20px" Width="169px"></asp:TextBox>
                </td>
                <td class="style4">
                    State:</td>
                <td>
                    <asp:TextBox ID="TextBox9" runat="server" Height="20px" Width="169px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    ZipCode:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox10" runat="server" Height="20px" Width="169px"></asp:TextBox>
                </td>
                <td class="style4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    Education:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox11" runat="server" Height="20px" Width="169px"></asp:TextBox>
                </td>
                <td class="style4">
                    Residency:</td>
                <td>
                    <asp:TextBox ID="TextBox13" runat="server" Height="20px" Width="169px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Date of Graduation:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox12" runat="server" Height="20px" Width="169px"></asp:TextBox>
                </td>
                <td class="style4">
                    Speciality:</td>
                <td>
                    <asp:TextBox ID="TextBox14" runat="server" Height="20px" Width="169px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    NPI:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox15" runat="server" Height="20px" Width="169px"></asp:TextBox>
                </td>
                <td class="style4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="Button1" runat="server" Height="24px" onclick="Button1_Click" 
                        Text="Update" Width="83px" />
                </td>
                <td class="style4">
                    <asp:Button ID="Button2" runat="server" Height="24px" onclick="Button2_Click" 
                        Text="Cancel" Width="83px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
