<%@ Page Title="" Language="VB" MasterPageFile="~/FacultyMaster.master" AutoEventWireup="false" CodeFile="facultyprofile.aspx.vb" Inherits="facultyprofile" %>

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
        <td align="center" 
            style="font-size: x-large; font-weight: bold; color: #FF0000">
            View Faculty Profile</td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="fid" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                GridLines="None" Width="671px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="fid" HeaderText="fid" ReadOnly="True" 
                        SortExpression="fid" />
                    <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                    <asp:BoundField DataField="branch" HeaderText="branch" 
                        SortExpression="branch" />
                    <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                    <asp:BoundField DataField="password" HeaderText="password" 
                        SortExpression="password" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:automationexamdbConnectionString7 %>" 
                SelectCommand="SELECT * FROM [faculty] WHERE ([fid] = @fid)" 
                DeleteCommand="DELETE FROM [faculty] WHERE [fid] = @fid" 
                InsertCommand="INSERT INTO [faculty] ([fid], [fname], [branch], [phone], [password]) VALUES (@fid, @fname, @branch, @phone, @password)" 
                UpdateCommand="UPDATE [faculty] SET [fname] = @fname, [branch] = @branch, [phone] = @phone, [password] = @password WHERE [fid] = @fid">
                <DeleteParameters>
                    <asp:Parameter Name="fid" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="fid" Type="String" />
                    <asp:Parameter Name="fname" Type="String" />
                    <asp:Parameter Name="branch" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="fid" SessionField="fid" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="fname" Type="String" />
                    <asp:Parameter Name="branch" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="fid" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
</asp:Content>

