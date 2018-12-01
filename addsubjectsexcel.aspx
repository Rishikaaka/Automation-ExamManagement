<%@ Page Title="" Language="VB" MasterPageFile="~/admin.master" AutoEventWireup="false" CodeFile="addsubjectsexcel.aspx.vb" Inherits="addsubjectsexcel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <style type="text/css">
        .style1
        {
            width: 40%;
            border-style: solid;
            border-width: 1px;
            background-color: #C0C0C0;
        }
        .style2
        {
            height: 58px;
        }
        .style3
        {
            height: 61px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table align="center" class="style1">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" 
                        Text="Add subject details through excel file"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Button ID="Button1" runat="server" Text="upload" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
</asp:Content>

