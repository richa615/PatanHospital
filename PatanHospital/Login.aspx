<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PatanHospital.WebForm1" %>

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
            width: 161px;
        }
        .style3
        {
            width: 24px;
        }
        .style4
        {
            width: 173px;
        }
        .style5
        {
            width: 16px;
        }
        .style6
        {
            width: 161px;
            height: 40px;
        }
        .style7
        {
            width: 24px;
            height: 40px;
        }
        .style8
        {
            width: 173px;
            height: 40px;
        }
        .style9
        {
            width: 16px;
            height: 40px;
        }
        .style10
        {
            height: 40px;
        }
        .style13
        {
            height: 26px;
            width: 110px;
        }
        .style14
        {
            width: 110px;
        }
        .style15
        {
            width: 219px;
        }
        .style16
        {
            height: 26px;
            width: 219px;
        }
        .style17
        {
            height: 21px;
        }
        .style18
        {
            height: 21px;
            width: 110px;
        }
        .style19
        {
            height: 21px;
            width: 219px;
        }
        .style20
        {
            height: 26px;
        }
        .style21
        {
            height: 21px;
            width: 218px;
        }
        .style22
        {
            height: 26px;
            width: 218px;
        }
        .style23
        {
            width: 218px;
        }
        .user 
        {
            color: lightblue;
        }
    </style>
</head>
<body bgcolor=#BDBDBD>
    <form id="form1" runat="server">
    <div align="center">
        <div style="font-size:large; font-weight:bold; background-color:#0489B1;"> 
            <h1 style="color:white;">Login</h1>
        </div>
        <div>
            <table class="style1" id="Table 1">

            <tr>
                <td class="style2">
                    <asp:RadioButton ID="RadioButton1" runat="server" 
                        oncheckedchanged="RadioButton1_CheckedChanged" Text="Administrator" 
                        AutoPostBack="True" GroupName="login" />
                </td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    <asp:RadioButton ID="RadioButton2" runat="server" Text="Doctor" 
                        AutoPostBack="True" GroupName="login" 
                        oncheckedchanged="RadioButton2_CheckedChanged" />
                </td>
                <td class="style5">
                    &nbsp;</td>
                <td>
                    <asp:RadioButton ID="RadioButton3" runat="server" Text="Patient" 
                        AutoPostBack="True" GroupName="login" 
                        oncheckedchanged="RadioButton3_CheckedChanged" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
    
    </div>
    <table class="style1" id="Table2" runat="server" align="center">
        <tr>
            <td class="style21">
                &nbsp;</td>
            <td class="style18">
                </td>
            <td class="style19">
                <asp:Label ID="Label1" runat="server" style="font-weight: 700" Visible="False"></asp:Label>
                </td>
            <td class="style17">
                </td>
        </tr>
        <tr>
            <td class="style21">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td class="style19">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style22">
            </td>
            <td class="style13">
                <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="style16">
                <asp:TextBox ID="TextBox1" runat="server" Width="221px"></asp:TextBox>
            </td>
            <td class="style20">
            </td>
        </tr>
        <tr>
            <td class="style23">
                &nbsp;</td>
            <td class="style14">
                Password:</td>
            <td class="style15">
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Height="22px" Width="218px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style23">
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style23">
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td class="style15">
                <asp:Button ID="Button1" runat="server" Text="Sign In" 
                    onclick="Button1_Click1" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Cancel" onclick="Button2_Click" />
            </td>
            <td>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style23">
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style23">
                &nbsp;</td>
            <td class="style14">
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/ForgotPassword.aspx">Forgot Password</asp:HyperLink>
            </td>
            <td class="style15">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/UpdatePassword.aspx">Update Password</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
        </div>
    </div>
    </form>
</body>
</html>
