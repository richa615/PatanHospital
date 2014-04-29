<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientScheduleAppointment.aspx.cs" Inherits="PatanHospital.PatientScheduleAppointment" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 800px;
        }
        .auto-style3
        {
            width: 123px;
            color:#23d6d0;
        }
        .auto-style4
        {
            width: 562px;
        }
        .auto-style5
        {
            width: 99px;
        }
        .auto-style6
        {
            width: 109px;
        }
        .auto-style7
        {
            width: 136px;
        }
        .auto-style8 {
            width: 123px;
            height: 23px;
        }
        .auto-style9 {
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
                <h1 style="color:white;">Schedule Appointment As Patient</h1>
        </div>
        <div>
            <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </ajaxToolkit:ToolkitScriptManager>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Log Out</asp:HyperLink>
        </div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    
                 </td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td class="auto-style8"></td>
                <td colspan="2" class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <strong>Name:</strong></td>
                <td colspan="2">
                    <asp:Label ID="Label2" runat="server" Text="Label" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><strong>Date:</strong></td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox1" runat="server" Height="20px" Width="160px"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBox1">
                    </ajaxToolkit:CalendarExtender>
                    <asp:Label ID="Label3" runat="server" Text="Label" ForeColor="White"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="Label" ForeColor="White"></asp:Label>
                    <asp:Label ID="Label5" runat="server" Text="Label" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><strong>Speciality:</strong></td>
                <td colspan="2">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Speciality" DataValueField="Speciality" AppendDataBoundItems="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Height="30px" Width="160px">
                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalServerConnectionString %>" SelectCommand="SELECT DISTINCT Speciality FROM DoctorCrediantials"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><strong>Doctor&#39;s Name:</strong></td>
                <td colspan="2">
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True"  DataTextField="Name" DataValueField="SSN" AppendDataBoundItems="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Height="30px" Width="160px">
                    
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
        </table>
    <p>
        <table id="Table2" class="auto-style1" runat="server">
            <tr>
                <td class="auto-style3"><strong>Start Time:</strong></td>
                <td class="auto-style3"><strong>End Time:</strong></td>
                <td class="auto-style3"><strong>Availability:</strong></td>
                <td>
                    <asp:Label ID="Label24" runat="server" Text="Label" ForeColor="White"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>
                    <asp:Label ID="Label25" runat="server" Text="Label" ForeColor="White"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label6" runat="server" Text="09:00 am" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label7" runat="server" Text="10:00 am" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label8" runat="server" ForeColor="Green" Text="Available" style="font-weight: 700"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="Reserve" OnClick="Button2_Click" style="font-weight: 700" Height="30px" Width="160px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label9" runat="server" Text="10:30 am" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label10" runat="server" Text="11:30 am" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label11" runat="server" ForeColor="Green" Text="Available" style="font-weight: 700"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button3" runat="server" Text="Reserve" OnClick="Button3_Click" style="font-weight: 700" Height="30px" Width="160px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label12" runat="server" Text="12:00 am" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label13" runat="server" Text="01:00 pm" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label14" runat="server" ForeColor="Green" Text="Available" style="font-weight: 700"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button4" runat="server" Text="Reserve" OnClick="Button4_Click" style="font-weight: 700" Height="30px" Width="160px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label15" runat="server" Text="02:00 pm" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label16" runat="server" Text="03:00 pm" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label17" runat="server" ForeColor="Green" Text="Available" style="font-weight: 700"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button5" runat="server" Text="Reserve" OnClick="Button5_Click" style="font-weight: 700" Height="30px" Width="160px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label18" runat="server" Text="03:30 pm" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label19" runat="server" Text="04:30 pm" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label20" runat="server" ForeColor="Green" Text="Available" style="font-weight: 700"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button6" runat="server" Text="Reserve" OnClick="Button6_Click" style="font-weight: 700" Height="30px" Width="160px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label21" runat="server" Text="05:00 pm" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label22" runat="server" Text="06:00 pm" style="font-weight: 700" ForeColor="White"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label23" runat="server" ForeColor="Green" Text="Available" style="font-weight: 700"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button7" runat="server" Text="Reserve" OnClick="Button7_Click" style="font-weight: 700" Height="30px" Width="160px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
        </div>
    </form>
    </body>
</html>
