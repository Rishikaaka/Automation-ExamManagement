<%@ Page Title="" Language="VB" MasterPageFile="~/FacultyMaster.master" AutoEventWireup="false" CodeFile="viewfacultyduties.aspx.vb" Inherits="viewfacultyduties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 80%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style1">
    <tr>
        <td align="center" style="font-size: x-large; color: #800000">
            VIEW FACULTY DUTIES&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        </td>
    </tr>
</table>
</asp:Content>

