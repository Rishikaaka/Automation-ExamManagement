<%@ Page Title="" Language="VB" MasterPageFile="~/homemaster.master" AutoEventWireup="false" CodeFile="home.aspx.vb" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 66%;
            height: 259px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style1">
        <tr>
            <td align="center" 
                style="font-size: xx-large; font-weight: bold; color: #0000FF">
                WELCOM TO HOME PAGE</td>
        </tr>
        <tr>
            <td align="center">
                <asp:Image ID="Image2" runat="server" Height="322px" 
                    ImageUrl="~/images/welcome2.jpg" Width="610px" />
            </td>
        </tr>
    </table>
</asp:Content>

