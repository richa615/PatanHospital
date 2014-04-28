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
<body bgcolor=#25272A>
    <form id="form1" runat="server">
    <div align="center">
        <div style="height:130px;">
            <img src="Images/PatanHospitalLogoPH.png" style="height: 174px; width: 499px; margin-top:50px;" />
        </div>
        <div style="width:500px;">
            <table style="margin-bottom:50px; margin-top:70px;">
                <tr>
                    <td>
                        <asp:RadioButton ID="RadioButton1" runat="server" 
                        oncheckedchanged="RadioButton1_CheckedChanged" Text="Administrator" 
                        AutoPostBack="True" GroupName="login" ForeColor="White" />
                    </td>
                    <td>
                         <asp:RadioButton ID="RadioButton2" runat="server" Text="Doctor" 
                        AutoPostBack="True" GroupName="login" 
                        oncheckedchanged="RadioButton2_CheckedChanged" ForeColor="White" />
                    </td>
                    <td>
                        <asp:RadioButton ID="RadioButton3" runat="server" Text="Patient" 
                        AutoPostBack="True" GroupName="login" 
                        oncheckedchanged="RadioButton3_CheckedChanged" ForeColor="White" />
                    </td>
                </tr>
            </table>
            <div>
                <asp:Label ID="Label1" runat="server" style="font-weight: 700" Visible="False" ForeColor="White"></asp:Label>
            </div>
            <div>
                 <asp:TextBox ID="TextBox1" runat="server" Width="221px" placeholder="User Name or Email" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            </div>
            <div>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Height="22px" Width="221px" placeholder="Password"></asp:TextBox>
            </div>
            <div style="margin-bottom:10px; margin-top:5px;">
                 <asp:Button ID="Button1" runat="server" Text="Sign In" 
                    onclick="Button1_Click1" /> 
            </div>
            <div>
                <div align="center" style="width:50%; display:inline;">
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/ForgotPassword.aspx">Forgot Password</asp:HyperLink>
                </div>
                <div align="center" style="width:50%; display:inline; padding-left:15px;">
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/UpdatePassword.aspx">Update Password</asp:HyperLink>
                </div>
                
                
            </div>

        </div>
    </div>
    </form>
</body>
</html>
