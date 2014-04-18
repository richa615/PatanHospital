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
    </style>
</head>
<body bgcolor=#BDBDBD>
    <form id="form1" runat="server">
    <div>
        <table style="width:650px" border="0" cellspacing="0" class="GridViewStyle">
        <tr class="HeaderStyle">
        <th class="auto-style1">&nbsp;</th>
        <th style="width:200px">&nbsp;</th>
        <th style="width:125px">&nbsp;</th>
        <th style="width:125px">&nbsp;</th>
        <th style="width:125px">&nbsp;</th>
        </tr>
        <tr class="HeaderStyle">
        <th class="auto-style1" colspan="5">Search For Doctor</th>
        </tr>
        <tr class="HeaderStyle">
        <th class="auto-style1">&nbsp;</th>
        <th style="width:200px">&nbsp;</th>
        <th style="width:125px">&nbsp;</th>
        <th style="width:125px">&nbsp;</th>
        <th style="width:125px">&nbsp;</th>
        </tr>
        <tr class="AltRowStyle">
        <td class="auto-style5">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Home" />
            </td>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Log Out</asp:HyperLink>
            </td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        </tr>
        <tr class="AltRowStyle">
        <td class="auto-style5">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        </tr>
        <tr class="AltRowStyle">
        <td class="auto-style5">Date</td>
        <td class="auto-style3">
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBox1">
            </asp:CalendarExtender>
            </td>
        <td class="auto-style4">
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
            </td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style4"></td>
        </tr>
        <tr class="AltRowStyle">
        <td class="auto-style1">&nbsp;</td>
        <td style="width:200px">&nbsp;</td>
        <td style="width:125px">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
        <td style="width:125px">&nbsp;</td>
        <td style="width:125px">&nbsp;</td>
        </tr>
        <tr>
        <td colspan="5">
        
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
        
        </td>
        </tr>
        <tr>
        <td colspan="5">
            &nbsp;</td>
        </tr>
        <tr>
        <td colspan="5">
            &nbsp;</td>
        </tr>
        <tr>
        <td colspan="5">
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="font-weight: 700" Text="Done" />
        </td>
        </tr>
        <tr>
        <td colspan="5">
            &nbsp;</td>
        </tr>
        <tr>
        <td colspan="5">
            &nbsp;</td>
        </tr>
        <tr>
        <td colspan="5">
            &nbsp;</td>
        </tr>
        </table>
        
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
    </div>
    
    </form>
</body>
</html>
