<%@ Page Title="" Language="VB" MasterPageFile="~/admin.master" AutoEventWireup="false" CodeFile="generateduties.aspx.vb" Inherits="generateduties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 40%;
            border-style: solid;
            border-width: 1px;
            background-color: #F0F0F0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="144px">
            <asp:ListItem>-select session-</asp:ListItem>
            <asp:ListItem>morning</asp:ListItem>
            <asp:ListItem>afternoon</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        <asp:Literal ID="Literal2" runat="server"></asp:Literal>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="available faculty list" />
    </p>
    <p>
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    &nbsp;
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem>-Exam type-</asp:ListItem>
            <asp:ListItem>mid-1</asp:ListItem>
            <asp:ListItem>mid-2</asp:ListItem>
            <asp:ListItem>semister</asp:ListItem>
            <asp:ListItem>Lab</asp:ListItem>
        </asp:DropDownList>
&nbsp;<asp:DropDownList ID="DropDownList5" runat="server">
            <asp:ListItem>-branch-</asp:ListItem>
            <asp:ListItem>cse</asp:ListItem>
            <asp:ListItem>ece</asp:ListItem>
            <asp:ListItem>eee</asp:ListItem>
            <asp:ListItem>me</asp:ListItem>
        </asp:DropDownList>
&nbsp;<asp:DropDownList ID="DropDownList3" runat="server">
            <asp:ListItem>-year-</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
        </asp:DropDownList>
&nbsp;
        <asp:DropDownList ID="DropDownList4" runat="server">
            <asp:ListItem>-sem-</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
        </asp:DropDownList>
    </p>
    <table class="style1">
        <tr>
            <td>
                Branch</td>
            <td>
                Year</td>
            <td>
                Sem</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                    <asp:ListItem>cse</asp:ListItem>
                    <asp:ListItem>ece</asp:ListItem>
                    <asp:ListItem>me</asp:ListItem>
                    <asp:ListItem>civil</asp:ListItem>
                </asp:CheckBoxList>
            </td>
            <td>
                <asp:CheckBoxList ID="CheckBoxList2" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                </asp:CheckBoxList>
            </td>
            <td>
                <asp:CheckBoxList ID="CheckBoxList3" runat="server" AutoPostBack="True">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                </asp:CheckBoxList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <p>
        <asp:Button ID="Button2" runat="server" Text="available free rooms" />
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

