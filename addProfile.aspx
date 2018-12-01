<%@ Page Title="" Language="VB" MasterPageFile="~/FacultyMaster.master" AutoEventWireup="false" CodeFile="addProfile.aspx.vb" Inherits="addProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 80%;
        }
        .style2
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style1">
        <tr>
            <td class="style2">
                Faculty Details</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:GridView ID="GridView1" runat="server" Height="200px" 
                    style="margin-left: 0px" Width="352px">
                    <Columns>
                        <asp:BoundField HeaderText="col4" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

