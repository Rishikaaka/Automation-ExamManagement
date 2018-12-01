<%@ Page Title="" Language="VB" MasterPageFile="~/admin.master" AutoEventWireup="false" CodeFile="ViewSubjects.aspx.vb" Inherits="ViewSubjects" %>

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
                View Subject Details</td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    Height="204px" Width="614px" AllowPaging="True" AllowSorting="True" 
                    AutoGenerateColumns="False" DataKeyNames="subjectid" 
                    DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="subjectid" HeaderText="subjectid" 
                            InsertVisible="False" ReadOnly="True" SortExpression="subjectid" />
                        <asp:BoundField DataField="subjectcode" HeaderText="subjectcode" 
                            SortExpression="subjectcode" />
                        <asp:BoundField DataField="subjectname" HeaderText="subjectname" 
                            SortExpression="subjectname" />
                        <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
                        <asp:BoundField DataField="sem" HeaderText="sem" SortExpression="sem" />
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
                    ConnectionString="<%$ ConnectionStrings:automationexamDBConnectionString2 %>" 
                    DeleteCommand="DELETE FROM [subjects] WHERE [subjectid] = @subjectid" 
                    InsertCommand="INSERT INTO [subjects] ([subjectcode], [subjectname], [year], [sem]) VALUES (@subjectcode, @subjectname, @year, @sem)" 
                    SelectCommand="SELECT * FROM [subjects]" 
                    UpdateCommand="UPDATE [subjects] SET [subjectcode] = @subjectcode, [subjectname] = @subjectname, [year] = @year, [sem] = @sem WHERE [subjectid] = @subjectid">
                    <DeleteParameters>
                        <asp:Parameter Name="subjectid" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="subjectcode" Type="String" />
                        <asp:Parameter Name="subjectname" Type="String" />
                        <asp:Parameter Name="year" Type="Int32" />
                        <asp:Parameter Name="sem" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="subjectcode" Type="String" />
                        <asp:Parameter Name="subjectname" Type="String" />
                        <asp:Parameter Name="year" Type="Int32" />
                        <asp:Parameter Name="sem" Type="String" />
                        <asp:Parameter Name="subjectid" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>