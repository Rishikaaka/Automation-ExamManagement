<%@ Page Title="" Language="VB" MasterPageFile="~/admin.master" AutoEventWireup="false" CodeFile="Timetables.aspx.vb" Inherits="Timetables" %>
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
                Add Timetables</td>
            <td rowspan="6">
                <asp:Image ID="Image2" runat="server" Height="192px" 
                    ImageUrl="~/images/index.jpg" Width="247px" style="margin-top: 0px" />
            </td>
        </tr>
        <tr>
            <td class="style2" style="font-size: large; font-weight: bold">
                FacultyId<br />
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    Height="36px" Width="187px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2" style="font-size: large; font-weight: bold">
                Day<br />
                <asp:TextBox ID="TextBox2" runat="server" Width="183px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2" style="font-size: large; font-weight: bold">
                class1<br />
                <asp:TextBox ID="TextBox5" runat="server" Width="180px"></asp:TextBox>
                <br />
                class2<br />
                <asp:TextBox ID="TextBox6" runat="server" Width="180px"></asp:TextBox>
                <br />
                class3<br />
                <asp:TextBox ID="TextBox7" runat="server" Width="180px"></asp:TextBox>
                <br />
                class4<br />
                <asp:TextBox ID="TextBox8" runat="server" Width="180px"></asp:TextBox>
                <br />
                class5<br />
                <asp:TextBox ID="TextBox9" runat="server" Width="180px"></asp:TextBox>
                <br />
                class6<br />
                <asp:TextBox ID="TextBox10" runat="server" Width="180px"></asp:TextBox>
                <br />
                class7<br />
                <asp:TextBox ID="TextBox11" runat="server" Width="180px"></asp:TextBox>
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
