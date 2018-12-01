Imports System.Data
Imports System.Data.SqlClient
Partial Class facultylogin
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim con As SqlConnection = DataBaseConnection.getDBConnection()
        If con Is Nothing Then
            Literal1.Text = "<h2> Database connection error.</h2>"
            Exit Sub
        End If
        con.Open()
        Dim qry = "select * from faculty where fid='" & TextBox1.Text & "' and password='" & TextBox2.Text & "'"
        Dim com As New SqlCommand(qry, con)
        Dim dr As SqlDataReader = com.ExecuteReader()
        If dr.Read() Then
            Session("fid") = dr("fid")
            Server.Transfer("facultyhome.aspx")
        Else
            Literal1.Text = "<h2> username or password incorrect</h2>"
            TextBox1.Text = ""
            TextBox2.Text = ""
        End If
        con.Close()
    End Sub
End Class

