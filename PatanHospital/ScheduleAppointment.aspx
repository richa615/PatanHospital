<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScheduleAppointment.aspx.cs" Inherits="PatanHospital.ScheduleAppointment" %>
 <%@ Register
Assembly="AjaxControlToolkit"
Namespace="AjaxControlToolkit"
TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 800px;
        }
        .auto-style1
        {
            width: 145px;
        }
        .auto-style2
        {
            width: 101px;
        }
        .auto-style3
        {
            width: 102px;
        }
        .auto-style4
        {
            width: 113px;
        }
        .auto-style5
        {
            width: 101px;
            height: 23px;
            font-weight: bold;
        }
        .auto-style6
        {
            width: 102px;
            height: 23px;
            font-weight: bold;
        }
        .auto-style7
        {
            width: 113px;
            height: 23px;
            font-weight: bold;
        }
        .auto-style8
        {
            height: 23px;
        }
        .auto-style9
        {
            color:#23d6d0;
            width: 145px;
            font-weight: bold;
        }
        .auto-style10
        {
            font-weight: bold;
        }
        .auto-style11
        {
            width: 113px;
            font-weight: bold;
        }
        .auto-style12
        {
            width: 102px;
            font-weight: bold;
        }
        .auto-style13
        {
            width: 101px;
            font-weight: bold;
        }
        .auto-style14 {
            width: 101px;
            height: 23px;
        }
        .auto-style15 {
            width: 102px;
            height: 23px;
        }
        .auto-style16 {
            width: 113px;
            height: 23px;
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
            <h1 style="color:white;">Schedule Appointment</h1>
        </div>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Login.aspx">Log Out</asp:HyperLink>
        <table id="Table1" class="style1">
            <tr>
                <td>
                    <strong style="color:#23d6d0;">Is the Patient Registered?</strong></td>
            </tr>
            <tr>
                <td>
                    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </ajaxToolkit:ToolkitScriptManager>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Yes" Height="30px" style="font-weight: 700" Width="160px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="No" Height="30px" style="font-weight: 700" Width="160px" />
                </td>
            </tr>
        </table>
    
    
    
    <table id="Table2" runat = "server" class="style1" align="center">

        <tr>
            <td class="auto-style9">
                Patients Name:</td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="SSN" style="margin-bottom: 0px" Height="30px" Width="160px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                Date:</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" Height="20px" Width="150px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBox1">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                Speciality:</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="30px" Width="160px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataTextField="Speciality" DataValueField="Speciality">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                Doctors Name:</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Height="30px" Width="160px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label19" runat="server" Text="Label" ForeColor="White"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalServerConnectionString %>" SelectCommand="SELECT Fname + ' ' + Lname AS Name, SSN FROM PatientCredientials"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="Label20" runat="server" Text="Label" ForeColor="White"></asp:Label>
            </td>
        </tr>
    </table>
    <table class="style1" runat="server" id="Table3">
        <tr>
            <td class="auto-style14"></td>
            <td class="auto-style15"></td>
            <td class="auto-style16"></td>
            <td class="auto-style8"></td>
        </tr>
        <tr>
            <td class="auto-style9">Start Time</td>
            <td class="auto-style9">End Time</td>
            <td class="auto-style9">
                <asp:HyperLink ID="HyperLink1" runat="server">Availability</asp:HyperLink>
            </td>
            <td><b></b></td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label7" runat="server" Text="09:00 am" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:Label ID="Label8" runat="server" Text="10:00 am" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:Label ID="Label1" runat="server" ForeColor="Green" Text="Available"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button3" runat="server" Font-Bold="True" Font-Overline="False" OnClick="Button3_Click" Text="Reserve" CssClass="auto-style10" Height="30px" Width="160px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label9" runat="server" Text="10:30 am" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:Label ID="Label10" runat="server" Text="11:30 am" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:Label ID="Label2" runat="server" ForeColor="Green" Text="Available"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button4" runat="server" Text="Reserve" OnClick="Button4_Click" CssClass="auto-style10" Height="30px" Width="160px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label11" runat="server" Text="12:00 pm" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:Label ID="Label12" runat="server" Text="01:00 pm" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:Label ID="Label3" runat="server" ForeColor="Green" Text="Available"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button5" runat="server" Text="Reserve" OnClick="Button5_Click" CssClass="auto-style10" Height="30px" Width="160px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label13" runat="server" Text="02:00 pm" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:Label ID="Label14" runat="server" Text="03:00 pm" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:Label ID="Label4" runat="server" ForeColor="Green" Text="Available"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button6" runat="server" Text="Reserve" OnClick="Button6_Click" CssClass="auto-style10" Height="30px" Width="160px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label15" runat="server" Text="03:30 pm" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:Label ID="Label16" runat="server" Text="04:30 pm" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:Label ID="Label5" runat="server" ForeColor="Green" Text="Available"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:Button ID="Button7" runat="server" Text="Reserve" OnClick="Button7_Click" CssClass="auto-style10" Height="30px" Width="160px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label17" runat="server" Text="05:00 pm" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:Label ID="Label18" runat="server" Text="06:00 pm" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:Label ID="Label6" runat="server" ForeColor="Green" Text="Available"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button8" runat="server" Text="Reserve" OnClick="Button8_Click" CssClass="auto-style10" Height="30px" Width="160px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style3">
                &nbsp;</td>
            <td class="auto-style4">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style3">
                &nbsp;</td>
            <td class="auto-style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style3">
                &nbsp;</td>
            <td class="auto-style4">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
        </div>
  <!--     <table width="100%" align="center" cellpadding="2" cellspacing="2" border="0" bgcolor="#EAEAEA" >
        <tr align="left" style="background-color:#004080;color:White;" >
                        
            
            <td> Start_Time </td>  
                                      
        </tr>

        

    </table>-->
    </form>
    </body>
</html>
