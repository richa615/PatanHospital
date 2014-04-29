<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorSchedule.aspx.cs" Inherits="PatanHospital.DoctorSchedule" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1
        {
        }
        .auto-style3
        {
            width: 200px;
            height: 21px;
        }
        .auto-style4
        {
            width: 125px;
            height: 21px;
        }
        .auto-style5
        {
            width: 136px;
            height: 21px;
        }
        .auto-style6
        {
            width: 81px;
        }
        .auto-style7
        {
            width: 81px;
            height: 21px;
        }
        .auto-style8 {
            height: 21px;
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
            <h1 style="color:white;">Search For Doctor</h1>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Log Out</asp:HyperLink>
        <table style="width:650px" border="0" cellspacing="0" class="GridViewStyle">
     
        <tr class="AltRowStyle">
        <td class="auto-style5">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style7">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        </tr>
        <tr class="AltRowStyle">
        <td style="color:#23d6d0;"><strong>Date:</strong></td>
        <td class="auto-style3">
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged" Height="20px" Width="160px"></asp:TextBox>
            <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBox1">
            </asp:CalendarExtender>
            </td>
        <td class="auto-style4">
            &nbsp;</td>
        <td class="auto-style7">&nbsp;</td>
        <td class="auto-style4"></td>
        </tr>
        <tr class="AltRowStyle">
        <td class="auto-style1">&nbsp;</td>
        <td style="width:200px">
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
            </td>
        <td style="width:125px; color:#23d6d0;">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
        <td class="auto-style6">&nbsp;</td>
        <td style="width:125px">&nbsp;</td>
        </tr>
        <tr>
        <td colspan="5">
        
            <asp:GridView ID="GridView1" runat="server" ForeColor="White">
            </asp:GridView>
        
        </td>
        </tr>
        
        </table>
        <div>
            <asp:Button ID="Button2" runat="server" OnClick="Logo_Click" style="font-weight: 700" Text="Done" Height="30px" Width="160px" />
        </div>
    </div>
    
    </form>
</body>
</html>
