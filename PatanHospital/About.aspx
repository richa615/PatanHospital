<%@ Page Title="About Us" Language="C#" AutoEventWireup="true" MasterPageFile="~/Master.master"
    CodeBehind="About.aspx.cs" Inherits="PatanHospital.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     
    <div align="center">
    
        <div align="center"  style="font-size:xx-large; font-weight:bold; background-color:#25272A;">
            <h1 style="color:white;">Administrator</h1>
        </div>
        <div align="center">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Login.aspx">Log Out</asp:HyperLink>
        </div>
        <table class="style1">
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <strong>Patients</strong></td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style3">
                    <strong>Doctors</strong></td>
                <td>
                    <strong>Schedules</strong></td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Button ID="Button1" runat="server" 
                        Text="Register a Patient" Width="150px" />
                </td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="Button2" runat="server" 
                        Text="Register a Doctor" Width="150px" />
                </td>
                <td>
                    <asp:Button ID="Button9" runat="server" Text="Schedule Appointments" 
                         />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Button ID="Button5" runat="server" Text="Edit Patient Information" 
                        Width="150px"  />
                </td>
                <td class="auto-style2">
                    </td>
                <td class="auto-style3">
                    <asp:Button ID="Button7" runat="server" 
                        Text="Edit Doctor Information" Width="150px" />
                </td>
                <td class="auto-style4">
                    <asp:Button ID="Button11" runat="server" Text="Delete Appointments" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Button ID="Button12" runat="server" Text="Delete Patients" 
                         />
                </td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="Button13" runat="server" Text="Delete Doctor" 
                         />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="Button8" runat="server" Text="Search Doctor" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
</asp:Content>

