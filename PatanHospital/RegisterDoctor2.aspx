<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterDoctor2.aspx.cs" Inherits="PatanHospital.RegisterDoctor2" %>

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
            width: 148px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Education:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Residency:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Date of Graduation:</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBox3" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Speciality:</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="150px">
                            <asp:ListItem Value="Acupuncture">Acupuncture</asp:ListItem>
	                        <asp:ListItem Value="Addiction Psychiatry">Addiction Psychiatry</asp:ListItem>
	                        <asp:ListItem Value="Adolescent Medicine">Adolescent Medicine</asp:ListItem>
	                        <asp:ListItem Value="Allergy/Immunology">Allergy/Immunology</asp:ListItem>
	                        <asp:ListItem Value="Anesthesiology">Anesthesiology</asp:ListItem>
                            <asp:ListItem Value="Bacteriology/Microbiology">Bacteriology/Microbiology</asp:ListItem>
	                        <asp:ListItem Value="Cardiovascular Disease">Cardiovascular Disease</asp:ListItem>
	                        <asp:ListItem Value="Child Neurology">Child Neurology</asp:ListItem>
	                        <asp:ListItem Value="Chiropractic">Chiropractic</asp:ListItem>
	                        <asp:ListItem Value="Dentistry">Dentistry</asp:ListItem>
	                        <asp:ListItem Value="Dermatology">Dermatology</asp:ListItem>
	                        <asp:ListItem Value="Dermatopathology">Dermatopathology</asp:ListItem>
	                        <asp:ListItem Value="Dietician">Dietician</asp:ListItem>
	                        <asp:ListItem Value="Gynecology">Gynecology</asp:ListItem>
	                        <asp:ListItem Value="Hematology">Hematology</asp:ListItem>
	                        <asp:ListItem Value="Hospice">Hospice</asp:ListItem>
	                        <asp:ListItem Value="Oncology">Oncology</asp:ListItem>
	                        <asp:ListItem Value="Naprapath">Naprapath</asp:ListItem>
	                        <asp:ListItem Value="Nephrology">Nephrology</asp:ListItem>
	                        <asp:ListItem Value="Neurology">Neurology</asp:ListItem>
	                        <asp:ListItem Value="Nutritionist">Nutritionist</asp:ListItem>
	                        <asp:ListItem Value="Obstetrics">Obstetrics</asp:ListItem>
	                        <asp:ListItem Value="Optometry">Optometry</asp:ListItem>
	                        <asp:ListItem Value="Otolaryngology">Otolaryngology</asp:ListItem>
	                        <asp:ListItem Value="Pathology">Pathology</asp:ListItem>
	                        <asp:ListItem Value="Pediatrics">Pediatrics</asp:ListItem>
	                        <asp:ListItem Value="Pharmacy">Pharmacy</asp:ListItem>
	                        <asp:ListItem Value="Podiatry">Podiatry</asp:ListItem>
	                        <asp:ListItem Value="Psychiatry">Psychiatry</asp:ListItem>
	                        <asp:ListItem Value="Radiology">Radiology</asp:ListItem>
	                        <asp:ListItem Value="Rheumatology">Rheumatology</asp:ListItem>
	                        <asp:ListItem Value="Telemedicine">Telemedicine</asp:ListItem>
	                        <asp:ListItem Value="Urology">Urology</asp:ListItem>
                    </asp:DropDownList>

                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    NPI:</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox4" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" Height="25px" onclick="Button1_Click" 
                        Text="Save" Width="108px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="Cancel" onclick="Button2_Click" 
                        CausesValidation="False" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
        <asp:Label ID="Label1" runat="server"></asp:Label>
    
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
