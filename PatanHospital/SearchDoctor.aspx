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
        <td class="auto-style5">Zip Code:</td>
        <td class="auto-style3"><asp:DropDownList ID="DoctorZipCode" runat="server" AppendDataBoundItems="True" 
            AutoPostBack="True" DataSourceID="sqlDataSourceDoctorZipCode" DataTextField="ZipCode" 
            DataValueField="ZipCode" Width="125px" Height="20px">
            <asp:ListItem Value="%">All</asp:ListItem>
        </asp:DropDownList></td>
        <td class="auto-style4"><strong>Speciality</strong></td>
        <td class="auto-style4"><asp:DropDownList ID="DoctorSpeciality" runat="server" AppendDataBoundItems="True" 
            AutoPostBack="True" DataSourceID="sqlDataSourceDoctorSpeciality" 
            DataTextField="Speciality" DataValueField="Speciality" Width="125px" Height="20px">
            <asp:ListItem Value="%">All</asp:ListItem>
        </asp:DropDownList></td>
        <td class="auto-style4"></td>
        </tr>
        <tr class="AltRowStyle">
        <td class="auto-style1">&nbsp;</td>
        <td style="width:200px">&nbsp;</td>
        <td style="width:125px">&nbsp;</td>
        <td style="width:125px">&nbsp;</td>
        <td style="width:125px">&nbsp;</td>
        </tr>
        <tr>
        <td colspan="5">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            DataSourceID="sqlDataSourceGridView" AutoGenerateColumns="False"
            CssClass="GridViewStyle" Width="650px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnDataBound="GridView1_DataBound">
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
