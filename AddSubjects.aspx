<%@ Page Title="" Language="VB" MasterPageFile="~/admin.master" AutoEventWireup="false" CodeFile="AddSubjects.aspx.vb" Inherits="AddSubjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 45%;
            height: 278px;
        }
        .style2
        {
        width: 239px;
    }
        .style3
        {
            width: 239px;
            height: 43px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style1" style="border-style: inset">
        <tr>
            <td align="center" class="style2" style="font-weight: bold; font-size: x-large">
                Add Subjects</td>
            <td rowspan="7">
                <asp:Image ID="Image2" runat="server" Height="192px" 
                    ImageUrl="~/images/index.jpg" Width="247px" style="margin-top: 0px" />
            </td>
        </tr>
        <tr>
            <td class="style2" style="font-size: large; font-weight: bold">
                SubjectCode<br />
                <asp:TextBox ID="TextBox2" runat="server" Width="183px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2" style="font-size: large; font-weight: bold">
                SubjectName<br />
                <asp:TextBox ID="TextBox5" runat="server" Width="180px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2" style="font-size: large; font-weight: bold">
                Sem<br />
                <asp:DropDownList ID="DropDownList1" runat="server" Height="51px" Width="183px">
                    <asp:ListItem>-select sem</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2" style="font-size: large; font-weight: bold">
                Year<br />
                <asp:TextBox ID="TextBox4" runat="server" Height="20px" Width="178px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Size="Large" 
                    Height="32px" style="margin-top: 18px; margin-right: 1px;" Text="Add" 
                    Width="81px" />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </td>
        </tr>
    </table>
</asp:Content>
