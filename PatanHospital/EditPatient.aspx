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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    
        <table class="style1">
            <tr>
                <td class="style2" colspan="4">
                    <strong>Edit Patient Information:</strong></td>
            </tr>
            <tr>
                <td class="style6">
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" style="font-weight: 700" Text="Home" />
                </td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style5">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Log Out</asp:HyperLink>
                </td>
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
                <td class="style3" colspan="4">
                    Name:<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="SSN" 
                        Height="19px" Width="192px" 
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
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
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
                <td class="style6">
                    First Name:</td>
                <td class="style4">
                    <asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="117px"></asp:TextBox>
                </td>
                <td class="style5">
                    Last Name:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    SSN:</td>
                <td class="style4">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
                <td class="style5">
                    Gender:</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Address1:</td>
                <td class="style4">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
                <td class="style5">
                    Address2:</td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    City</td>
                <td class="style4">
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                </td>
                <td class="style5">
                    State:</td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Zip Code:</td>
                <td class="style4">
                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                </td>
                <td class="style5">
                    Phone:</td>
                <td>
                    <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Email:</td>
                <td class="style4">
                    <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
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
                <td class="style6">
                    &nbsp;</td>
                <td class="style4">
                    <asp:Button ID="Button1" runat="server" Height="26px" onclick="Button1_Click" 
                        Text="Update" Width="113px" />
                </td>
                <td class="style5">
                    <asp:Button ID="Button2" runat="server" Height="23px" onclick="Button2_Click" 
                        Text="Cancel" Width="98px" CausesValidation="False" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
