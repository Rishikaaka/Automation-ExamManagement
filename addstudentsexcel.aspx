<%@ Page Title="" Language="VB" MasterPageFile="~/admin.master" AutoEventWireup="false" CodeFile="addstudentsexcel.aspx.vb" Inherits="addstudentsexcel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
    </p>
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <p>
    </p>
    <asp:Button ID="Button1" runat="server" Text="upload" />
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    <p>
    </p>
</asp:Content>

