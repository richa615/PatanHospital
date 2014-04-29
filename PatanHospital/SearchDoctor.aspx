<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchDoctor.aspx.cs" Inherits="PatanHospital.SearchDoctor" %>

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
        .auto-style6
        {
            width: 72px;
        }
        .auto-style7
        {
            color:#23d6d0;
            width: 72px;
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
            <h1 style="color:white;">Doctor Search</h1>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Log Out</asp:HyperLink>
        <table style="width:650px" border="0" cellspacing="0" class="GridViewStyle">
        <tr class="AltRowStyle">
        <td class="auto-style7"><strong style="text-align: right">Zip Code:</strong></td>
        <td class="auto-style3"><asp:DropDownList ID="DoctorZipCode" runat="server" AppendDataBoundItems="True" 
            AutoPostBack="True" DataSourceID="sqlDataSourceDoctorZipCode" DataTextField="ZipCode" 
            DataValueField="ZipCode" Width="160px" Height="30px">
            <asp:ListItem Value="%">All</asp:ListItem>
        </asp:DropDownList></td>
        <td class="auto-style7"><strong>Speciality:</strong></td>
        <td class="auto-style4"><asp:DropDownList ID="DoctorSpeciality" runat="server" AppendDataBoundItems="True" 
            AutoPostBack="True" DataSourceID="sqlDataSourceDoctorSpeciality" 
            DataTextField="Speciality" DataValueField="Speciality" Width="160px" Height="30px">
            <asp:ListItem Value="%">All</asp:ListItem>
        </asp:DropDownList></td>
        </tr>
        <tr class="AltRowStyle">
        <td class="auto-style6">&nbsp;</td>
        <td style="width:200px">&nbsp;</td>
        <td style="width:125px">&nbsp;</td>
        <td style="width:125px">&nbsp;</td>
        </tr>
        <tr>
        <td colspan="4">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            DataSourceID="sqlDataSourceGridView" AutoGenerateColumns="False"
            CssClass="GridViewStyle" Width="650px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnDataBound="GridView1_DataBound" ForeColor="White">
            <Columns>
                <asp:BoundField DataField="DName" HeaderText="Name" ReadOnly="True" SortExpression="DName" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" ItemStyle-Width="100px" SortExpression="Phone">
                </asp:BoundField>
                <asp:BoundField DataField="email" HeaderText="Email" ItemStyle-Width="100px" SortExpression="email" >
                </asp:BoundField>
                <asp:BoundField DataField="Education" HeaderText="Education" SortExpression="Education" />
                <asp:BoundField DataField="Residency" HeaderText="Residency" SortExpression="Residency" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="NPI" HeaderText="NPI" SortExpression="NPI" />
                <asp:BoundField DataField="DateOfGraduation" HeaderText="Graduation" SortExpression="DateOfGraduation" />
                <asp:BoundField DataField="Speciality" HeaderText="Speciality" SortExpression="Speciality" />
                <asp:BoundField DataField="Address1" HeaderText="Address1" SortExpression="Address1" />
                <asp:BoundField DataField="Address2" HeaderText="Address2" SortExpression="Address2" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
            </Columns>
            <RowStyle CssClass="RowStyle" />
            <PagerStyle CssClass="PagerStyle" />
            <SelectedRowStyle CssClass="SelectedRowStyle" />
            <HeaderStyle CssClass="HeaderStyle" />
            <AlternatingRowStyle CssClass="AltRowStyle" />
        </asp:GridView>
        </td>
        </tr>
        <tr>
        <td colspan="4">
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="font-weight: 700" Text="Done" Height="30px" Width="160px" />
        </td>
        </tr>
        </table>
        
        <br />
        <asp:SqlDataSource ID="sqlDataSourceDoctorZipCode" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HospitalServerConnectionString %>" 
            SelectCommand="SELECT ZipCode FROM DoctorAddress"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlDataSourceDoctorSpeciality" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HospitalServerConnectionString %>" 
            SelectCommand="SELECT Distinct Speciality FROM DoctorCrediantials"></asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:SqlDataSource ID="sqlDataSourceGridView" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HospitalServerConnectionString %>" 
            SelectCommand="SELECT DoctorCrediantials.Fname + ' ' + DoctorCrediantials.Lname AS DName, DoctorCrediantials.Phone, DoctorCrediantials.email, DoctorCrediantials.Education, DoctorCrediantials.Residency, DoctorCrediantials.Gender, DoctorCrediantials.NPI, DoctorCrediantials.DateOfGraduation, DoctorCrediantials.Speciality, DoctorAddress.Address1, DoctorAddress.Address2, DoctorAddress.City, DoctorAddress.State, DoctorAddress.ZipCode FROM DoctorAddress INNER JOIN DoctorCrediantials ON DoctorAddress.DSSN = DoctorCrediantials.SSN" 
            FilterExpression="[ZipCode] like '{0}%' and [Speciality] like '{1}%'">
            <FilterParameters>
            <asp:ControlParameter ControlID="DoctorZipCode" Name="ZipCode" 
                    PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DoctorSpeciality" Name="Speciality" 
                    PropertyName="SelectedValue" Type="String" />
            </FilterParameters>
         </asp:SqlDataSource>
        <br />
    </div>
    
    </form>
</body>
</html>
