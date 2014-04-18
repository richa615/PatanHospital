<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorHome.aspx.cs" Inherits="PatanHospital.DoctorHome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
            width: 616px;
        }
    </style>
</head>
<body bgcolor=#BDBDBD>
    <form id="form1" runat="server">
    <div align="center">
    <div style="font-size:xx-large; font-weight:bold;"> 
        Doctor Home
    </div>
        <div style="padding:10px;">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Log Out</asp:HyperLink>
        </div>
        <div style="width:201px; height: 93px; background-color:white;">
            <div style="padding:10px;">
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="font-weight: 700;" Text="View Profile" />
            </div>
            <div>
                <asp:Button ID="Button3" runat="server" style="font-weight: 700" Text="View Schedule" />
            </div>   
        </div>
         
    </div>
    </form>
</body>
</html>
