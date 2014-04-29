<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateDoctor.aspx.cs" Inherits="PatanHospital.UpdateDoctor" %>

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
        }
        .style3
        {
            width: 196px;
            text-align: left;
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
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style2
        {
            width: 141px;
            text-align: right;
            color:#23d6d0;
        }
        .auto-style3
        {
            width: 141px;
            text-align: right;
            font-weight: bold;
            color:#23d6d0;
        }
        .auto-style4
        {
            width: 126px;
            font-weight: bold;
            text-align: right;
            color:#23d6d0;
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
            <h1 style="color:white;">Edit Doctor Information</h1>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Log Out</asp:HyperLink>
        <table class="style1">
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td class="style3">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HospitalServerConnectionString %>" 
                        
                        SelectCommand="SELECT Fname + ' ' + Lname AS Name, SSN FROM DoctorCrediantials" 
                        onselecting="SqlDataSource1_Selecting">
                    </asp:SqlDataSource>
                </td>
                <td class="style4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <strong>Name:</strong></td>
                <td class="style3">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="SSN" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged" Height="30px" Width="160px">
                    </asp:DropDownList>
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
                    <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="White"></asp:Label>
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
                <td class="auto-style3">
                    First Name:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox1" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    Last Name:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="TextBox2" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    SSN:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox3" runat="server" ontextchanged="TextBox3_TextChanged" Height="20px" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    Phone Number:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="TextBox4" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    Gender:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox5" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    Email:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="TextBox6" runat="server" ontextchanged="TextBox6_TextChanged" Height="20px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    Address1:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox7" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    Address2:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="TextBox8" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    City:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox9" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    State:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="TextBox10" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    ZipCode:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox11" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    Education:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox12" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    Residency:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="TextBox13" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    Date of Graduation:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox14" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    Speciality:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="TextBox15" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    NPI:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox16" runat="server" 
                        ontextchanged="TextBox16_TextChanged" Height="20px" Width="150px" ></asp:TextBox>
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
                    <asp:Button ID="Button1" runat="server" Height="30px" onclick="Button1_Click" 
                        Text="Update" Width="160px" style="font-weight: 700" />
                </td>
                <td class="style4">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button2" runat="server" Height="30px" onclick="Logo_Click" 
                        Text="Cancel" Width="160px" style="font-weight: 700" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
