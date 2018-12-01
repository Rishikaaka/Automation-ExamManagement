<%@ Page Title="" Language="VB" MasterPageFile="~/admin.master" AutoEventWireup="false" CodeFile="ViewRooms.aspx.vb" Inherits="ViewRooms" %>

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
                View RoomDetail&#39;s</td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    Height="204px" Width="614px" AllowPaging="True" AllowSorting="True" 
                    AutoGenerateColumns="False" DataKeyNames="roomid" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="roomid" HeaderText="roomid" InsertVisible="False" 
                            ReadOnly="True" SortExpression="roomid" />
                        <asp:BoundField DataField="roomno" HeaderText="roomno" 
                            SortExpression="roomno" />
                        <asp:BoundField DataField="capacity" HeaderText="capacity" 
                            SortExpression="capacity" />
                        <asp:BoundField DataField="block" HeaderText="block" SortExpression="block" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:automationexamDBConnectionString4 %>" 
                    DeleteCommand="DELETE FROM [rooms] WHERE [roomid] = @roomid" 
                    InsertCommand="INSERT INTO [rooms] ([roomno], [capacity], [block]) VALUES (@roomno, @capacity, @block)" 
                    SelectCommand="SELECT * FROM [rooms]" 
                    UpdateCommand="UPDATE [rooms] SET [roomno] = @roomno, [capacity] = @capacity, [block] = @block WHERE [roomid] = @roomid">
                    <DeleteParameters>
                        <asp:Parameter Name="roomid" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="roomno" Type="Int32" />
                        <asp:Parameter Name="capacity" Type="Int32" />
                        <asp:Parameter Name="block" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="roomno" Type="Int32" />
                        <asp:Parameter Name="capacity" Type="Int32" />
                        <asp:Parameter Name="block" Type="String" />
                        <asp:Parameter Name="roomid" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
