<%@ Page Title="" Language="VB" MasterPageFile="~/FacultyMaster.master" AutoEventWireup="false" CodeFile="dutiescancellation.aspx.vb" Inherits="dutiescancellation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 50%;
            border: 2px solid #000000;
            height: 179px;
        }
        .style2
        {
        }
        .style3
        {
            width: 337px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style1">
        <tr>
            <td class="style2" align="center" colspan="2" 
                style="font-size: large; font-weight: bold">
                Duties Cancellaization</td>
        </tr>
        <tr>
            <td class="style3" align="right">
                Duty id</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3" align="right">
                Reason</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2" align="center" colspan="2">
                <asp:Button ID="Button1" runat="server" Text="ADD" />
                <br />
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </td>
        </tr>
    </table>
</asp:Content>

