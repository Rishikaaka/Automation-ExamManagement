Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb

Partial Class addtimetableexcel
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim filename As String = ""

        If FileUpload1.HasFile Then
            Try
                filename = "timetable.xls"
                FileUpload1.SaveAs(Server.MapPath("~/docs/") & filename)
            Catch ex As Exception
                Literal1.Text = ex.Message
                Exit Sub
            End Try
        End If

        filename = Server.MapPath("~/docs/" & filename)
        Try
            Dim connStr As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & filename & ";Extended Properties=""Excel 12.0;HDR=Yes;IMEX=2"""
            Dim MyConnection As OleDbConnection
            Dim ds As DataSet
            Dim MyCommand As OleDbDataAdapter
            MyConnection = New OleDbConnection(connStr)
            MyCommand = New OleDbDataAdapter("select * from [Sheet1$]", MyConnection)
            ds = New System.Data.DataSet()
            MyCommand.Fill(ds)
            Dim r As DataRow
            Dim i As Integer
            Dim con As SqlConnection = DataBaseConnection.getDBConnection()
            If con Is Nothing Then
                Literal1.Text = "<h2> Database connection error.</h2>"
                Exit Sub
            End If
            con.Open()
            For i = 0 To ds.Tables(0).Rows.Count - 1
                r = ds.Tables(0).Rows(i)
                Dim qry = "insert into timetable(fid,day,class1,class2,class3,class4,class5,class6,class7) values('" & r(0) & "','" & r(1) & "','" & r(2) & "','" & r(3) & "','" & r(4) & "','" & r(5) & "','" & r(6) & "','" & r(7) & "','" & r(8) & "')"
                Dim com As New SqlCommand(qry, con)
                com.ExecuteNonQuery()
            Next
            con.Close()
            MyConnection.Close()
            Literal1.Text = "<h1> Timetable Added Successfully...</h1>"

        Catch ex As Exception
            Literal1.Text = ex.ToString()
        End Try
    End Sub
End Class
