<%@ Page Title="" Language="VB" MasterPageFile="~/admin.master" AutoEventWireup="false" CodeFile="ViewExams.aspx.vb" Inherits="ViewExams" %>

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
                View Exams</td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    Height="204px" Width="614px" AutoGenerateColumns="False" 
                    DataKeyNames="examid" DataSourceID="SqlDataSource1" AllowPaging="True" 
                    AllowSorting="True">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="examid" HeaderText="examid" InsertVisible="False" 
                            ReadOnly="True" SortExpression="examid" />
                        <asp:BoundField DataField="subjectid" HeaderText="subjectid" 
                            SortExpression="subjectid" />
                        <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
                        <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
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
                    ConnectionString="<%$ ConnectionStrings:automationexamDBConnectionString5 %>" 
                    DeleteCommand="DELETE FROM [exams] WHERE [examid] = @examid" 
                    InsertCommand="INSERT INTO [exams] ([subjectid], [year], [date]) VALUES (@subjectid, @year, @date)" 
                    SelectCommand="SELECT * FROM [exams]" 
                    UpdateCommand="UPDATE [exams] SET [subjectid] = @subjectid, [year] = @year, [date] = @date WHERE [examid] = @examid">
                    <DeleteParameters>
                        <asp:Parameter Name="examid" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="subjectid" Type="Int32" />
                        <asp:Parameter Name="year" Type="Int32" />
                        <asp:Parameter Name="date" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="subjectid" Type="Int32" />
                        <asp:Parameter Name="year" Type="Int32" />
                        <asp:Parameter Name="date" Type="DateTime" />
                        <asp:Parameter Name="examid" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
