Imports System.Data
Imports System.Data.SqlClient
Partial Class AddExam
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim con As SqlConnection = DataBaseConnection.getDBConnection()
        If con Is Nothing Then
            Literal1.Text = "<h2> Database connection error.</h2>"
            Exit Sub
        End If
        con.Open()
        Dim qry = "insert into exams(subjectid,year,date) values('" & TextBox2.Text & "','" & TextBox5.Text & "','" & TextBox4.Text & "')"
        Dim com As New SqlCommand(qry, con)
        Dim n = com.ExecuteNonQuery()
        If n = 0 Then
            Literal1.Text = "<h2>Exam details not entered properly.  Try again!!!!!!! </h2>"
        Else
            Literal1.Text = "<h2>Exam details added successfully....</h2>"

            TextBox2.Text = ""
            TextBox5.Text = ""
            TextBox4.Text = ""
        End If
        con.Close()


    End Sub
End Class
