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
        .auto-style2
        {
            height: 6px;
        }
        .auto-style3
        {
            width: 123px;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2"><strong>Patient Scheduling Appointment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </ajaxToolkit:ToolkitScriptManager>
                    </strong></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="Button1" runat="server" style="font-weight: 700" Text="Home" OnClick="Button1_Click" />
                 </td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Log Out</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    Name:</td>
                <td colspan="2">
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Date:</td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBox1">
                    </ajaxToolkit:CalendarExtender>
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Speciality:</td>
                <td colspan="2">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Speciality" DataValueField="Speciality" AppendDataBoundItems="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalServerConnectionString %>" SelectCommand="SELECT DISTINCT Speciality FROM DoctorCrediantials"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Doctor&#39;s Name:</td>
                <td colspan="2">
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True"  DataTextField="Name" DataValueField="SSN" AppendDataBoundItems="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                    
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
                <td class="auto-style5">Start Time:</td>
                <td class="auto-style6">End Time:</td>
                <td class="auto-style7">Availability:</td>
                <td>
                    <asp:Label ID="Label24" runat="server" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>
                    <asp:Label ID="Label25" runat="server" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label6" runat="server" Text="09:00 am"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label7" runat="server" Text="10:00 am"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label8" runat="server" ForeColor="Green" Text="Available"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="Reserve" OnClick="Button2_Click" style="font-weight: 700" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label9" runat="server" Text="10:30 am"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label10" runat="server" Text="11:30 am"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label11" runat="server" ForeColor="Green" Text="Available"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button3" runat="server" Text="Reserve" OnClick="Button3_Click" style="font-weight: 700" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label12" runat="server" Text="12:00 am"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label13" runat="server" Text="01:00 pm"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label14" runat="server" ForeColor="Green" Text="Available"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button4" runat="server" Text="Reserve" OnClick="Button4_Click" style="font-weight: 700" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label15" runat="server" Text="02:00 pm"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label16" runat="server" Text="03:00 pm"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label17" runat="server" ForeColor="Green" Text="Available"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button5" runat="server" Text="Reserve" OnClick="Button5_Click" style="font-weight: 700" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label18" runat="server" Text="03:30 pm"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label19" runat="server" Text="04:30 pm"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label20" runat="server" ForeColor="Green" Text="Available"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button6" runat="server" Text="Reserve" OnClick="Button6_Click" style="font-weight: 700" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label21" runat="server" Text="05:00 pm"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label22" runat="server" Text="06:00 pm"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label23" runat="server" ForeColor="Green" Text="Available"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button7" runat="server" Text="Reserve" OnClick="Button7_Click" style="font-weight: 700" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    </form>
    </body>
</html>
