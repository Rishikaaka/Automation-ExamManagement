Imports System.Data
Imports System.Data.SqlClient
Partial Class addstudent
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim con As SqlConnection = DataBaseConnection.getDBConnection()
        If con Is Nothing Then
            Literal1.Text = "<h2> Database connection error.</h2>"
            Exit Sub
        End If
        con.Open()
        Dim qry = "insert into student(sid,sname,dept,Sem,year,phone) values('" & TextBox1.Text & "','" & TextBox2.Text & "','" & DropDownList1.SelectedValue & "','" & TextBox3.Text & "','" & DropDownList2.SelectedValue & "','" & TextBox4.Text & "')"
        Dim com As New SqlCommand(qry, con)
        Dim n = com.ExecuteNonQuery()
        If n = 0 Then
            Literal1.Text = "<h2>student details not added.  Try again!!!!!!! </h2>"
        Else
            Literal1.Text = "<h2> student details added successfully....</h2>"

            TextBox1.Text = ""
            TextBox2.Text = ""
            TextBox3.Text = ""
            TextBox4.Text = ""
        End If
        con.Close()

    End Sub
End Class
