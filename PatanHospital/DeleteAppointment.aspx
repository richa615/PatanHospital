<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="DeleteAppointment.aspx.cs" Inherits="PatanHospital.DeleteAppointment" %>

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
<body>
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
        <th class="auto-style1" colspan="5">Deleting the Appointment Schedules by the Administrator</th>
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
        <td class="auto-style5">Patient Name</td>
        <td class="auto-style3"><asp:DropDownList ID="PatientName" runat="server" AppendDataBoundItems="True" 
            AutoPostBack="True" DataSourceID="sqlDataSourcePatientName" DataTextField="PName" 
            DataValueField="PName" Width="125px" Height="20px">
            <asp:ListItem Value="%">All</asp:ListItem>
        </asp:DropDownList></td>
        <td class="auto-style4">Doctor Name</td>
        <td class="auto-style4"><asp:DropDownList ID="DoctorName" runat="server" AppendDataBoundItems="True" 
            AutoPostBack="True" DataSourceID="sqlDataSourceDoctorName" 
            DataTextField="DName" DataValueField="DName" Width="125px" Height="20px">
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
            CssClass="GridViewStyle" Width="650px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="id" OnDataBound="GridView1_DataBound">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="Date" HeaderText="Date" ItemStyle-Width="100px" SortExpression="Date">
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="Start_Time" HeaderText="Start Time" ItemStyle-Width="100px" SortExpression="Start_Time" >
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="End_Time" HeaderText="End Time" SortExpression="End_Time" />
                <asp:BoundField DataField="PName" HeaderText="Patient Name" ReadOnly="True" SortExpression="PName" />
                <asp:BoundField DataField="DName" HeaderText="Doctor Name" ReadOnly="True" SortExpression="DName" />
            </Columns>
            <RowStyle CssClass="RowStyle" />
            <PagerStyle CssClass="PagerStyle" />
            <SelectedRowStyle CssClass="SelectedRowStyle" />
            <HeaderStyle CssClass="HeaderStyle" />
            <AlternatingRowStyle CssClass="AltRowStyle" />
        </asp:GridView>
        </td>
        </tr>
        </table>
        
        <br />
        <asp:SqlDataSource ID="sqlDataSourcePatientName" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HospitalServerConnectionString %>" 
            SelectCommand="SELECT Fname + ' ' + Lname AS PName, SSN FROM PatientCredientials"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlDataSourceDoctorName" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HospitalServerConnectionString %>" 
            SelectCommand="SELECT Fname + ' ' + Lname AS DName, SSN FROM DoctorCrediantials"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlDataSourceGridView" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HospitalServerConnectionString %>" 
            SelectCommand="SELECT DoctorSchedule.id,DoctorSchedule.Date, DoctorSchedule.Start_Time, DoctorSchedule.End_Time, PatientCredientials.Fname + ' ' + PatientCredientials.Lname AS PName, DoctorCrediantials.Fname + ' ' + DoctorCrediantials.Lname AS DName  FROM DoctorSchedule INNER JOIN DoctorCrediantials ON DoctorSchedule.D_SSN = DoctorCrediantials.SSN INNER JOIN PatientCredientials ON DoctorSchedule.P_SSN = PatientCredientials.SSN" 
            FilterExpression="[PName] like '{0}%' and [Dname] like '{1}%'" DeleteCommand="DELETE FROM [DoctorSchedule] WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <FilterParameters>
            <asp:ControlParameter ControlID="PatientName" Name="PName" 
                    PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DoctorName" Name="DName" 
                    PropertyName="SelectedValue" Type="String" />
            </FilterParameters>
         </asp:SqlDataSource>
        <br />
    </div>
    
    </form>
</body>
</html>
