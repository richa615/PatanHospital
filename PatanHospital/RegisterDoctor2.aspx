<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterDoctor2.aspx.cs" Inherits="PatanHospital.RegisterDoctor2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 500px;
        }
        .style2
        {
            width: 148px;
            text-align: left;
            
        }
        .auto-style2
        {
            width: 148px;
            text-align: left;
            font-weight: bold;
            color:#23d6d0;
        }
        .auto-style3 {
            width: 8px;
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
            <h1 style="color:white;">Doctor Registration</h1>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Log Out</asp:HyperLink>
        <div>
            <asp:Label ID="Label2" runat="server" Text="Label" ForeColor="White"></asp:Label>
        </div>
        <table class="style1">
            <tr>
                <td class="auto-style2">
                    Education:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="TextBox1" runat="server" Width="150px" Height="20px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    Residency:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="TextBox2" runat="server" Width="150px" Height="20px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    Date of Graduation:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="TextBox3" runat="server" Width="150px" Height="20px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBox3" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    Speciality:</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="160px" Height="30px">
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
            </tr>
            <tr>
                <td class="auto-style2">
                    NPI:</td>
                <td style="text-align: left">
                    <asp:TextBox ID="TextBox4" runat="server" Width="150px" Height="20px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox4" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
        </table>
        <div style="display:inline;">
            <asp:Button ID="Button1" runat="server" Height="30px" onclick="Button1_Click" 
                        Text="Save" Width="160px" style="font-weight: 700" />
        </div>
        <div  style="display:inline; margin-left:10px;">
            <asp:Button ID="Button2" runat="server" Text="Cancel" onclick="Logo_Click" 
                        CausesValidation="False" Height="30px" style="font-weight: 700" Width="160px" />
        </div>
        <div>
            <asp:Label ID="Label3" runat="server" Text="Label" ForeColor="White"></asp:Label>
        </div>
        
    
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
