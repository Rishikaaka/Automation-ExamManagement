<%@ Page Title="" Language="VB" MasterPageFile="~/admin.master" AutoEventWireup="false" CodeFile="ViewTimetables.aspx.vb" Inherits="ViewTimetables" %>

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
                View Timetable&#39;s</td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    Height="204px" Width="614px" AllowPaging="True" AllowSorting="True" 
                    AutoGenerateColumns="False" DataKeyNames="tid" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="tid" HeaderText="tid" InsertVisible="False" 
                            ReadOnly="True" SortExpression="tid" />
                        <asp:BoundField DataField="day" HeaderText="day" SortExpression="day" />
                        <asp:BoundField DataField="class1" HeaderText="class1" 
                            SortExpression="class1" />
                        <asp:BoundField DataField="class2" HeaderText="class2" 
                            SortExpression="class2" />
                        <asp:BoundField DataField="class3" HeaderText="class3" 
                            SortExpression="class3" />
                        <asp:BoundField DataField="class4" HeaderText="class4" 
                            SortExpression="class4" />
                        <asp:BoundField DataField="class5" HeaderText="class5" 
                            SortExpression="class5" />
                        <asp:BoundField DataField="class6" HeaderText="class6" 
                            SortExpression="class6" />
                        <asp:BoundField DataField="class7" HeaderText="class7" 
                            SortExpression="class7" />
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
                    ConnectionString="<%$ ConnectionStrings:automationexamDBConnectionString6 %>" 
                    DeleteCommand="DELETE FROM [timetable] WHERE [tid] = @tid" 
                    InsertCommand="INSERT INTO [timetable] ([day], [class1], [class2], [class3], [class4], [class5], [class6], [class7]) VALUES (@day, @class1, @class2, @class3, @class4, @class5, @class6, @class7)" 
                    SelectCommand="SELECT * FROM [timetable]" 
                    UpdateCommand="UPDATE [timetable] SET [day] = @day, [class1] = @class1, [class2] = @class2, [class3] = @class3, [class4] = @class4, [class5] = @class5, [class6] = @class6, [class7] = @class7 WHERE [tid] = @tid">
                    <DeleteParameters>
                        <asp:Parameter Name="tid" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="day" Type="String" />
                        <asp:Parameter Name="class1" Type="String" />
                        <asp:Parameter Name="class2" Type="String" />
                        <asp:Parameter Name="class3" Type="String" />
                        <asp:Parameter Name="class4" Type="String" />
                        <asp:Parameter Name="class5" Type="String" />
                        <asp:Parameter Name="class6" Type="String" />
                        <asp:Parameter Name="class7" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="day" Type="String" />
                        <asp:Parameter Name="class1" Type="String" />
                        <asp:Parameter Name="class2" Type="String" />
                        <asp:Parameter Name="class3" Type="String" />
                        <asp:Parameter Name="class4" Type="String" />
                        <asp:Parameter Name="class5" Type="String" />
                        <asp:Parameter Name="class6" Type="String" />
                        <asp:Parameter Name="class7" Type="String" />
                        <asp:Parameter Name="tid" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
