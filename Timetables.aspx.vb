Imports System.Data
Imports System.Data.SqlClient
Partial Class Timetables
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim con As SqlConnection = DataBaseConnection.getDBConnection()
        If con Is Nothing Then
            Literal1.Text = "<h2> Database connection error.</h2>"
            Exit Sub
        End If
        con.Open()
        Dim qry = "insert into timetable(day,class1,class2,class3,class4,class5,class6,class7) values('" & TextBox2.Text & "','" & TextBox5.Text & "','" & TextBox6.Text & "','" & TextBox7.Text & "','" & TextBox8.Text & "','" & TextBox9.Text & "','" & TextBox10.Text & "','" & TextBox11.Text & "')"
        Dim com As New SqlCommand(qry, con)
        Dim n = com.ExecuteNonQuery()
        If n = 0 Then
            Literal1.Text = "<h2>Time table not added.  Try again!!!!!!! </h2>"
        Else
            Literal1.Text = "<h2>Time Table details added successfully....</h2>"


            TextBox2.Text = ""
            TextBox5.Text = ""
            TextBox6.Text = ""
            TextBox7.Text = ""
            TextBox8.Text = ""
            TextBox9.Text = ""
            TextBox10.Text = ""
            TextBox11.Text = ""
        End If
        con.Close()


    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim con As SqlConnection = DataBaseConnection.getDBConnection()
            If con Is Nothing Then
                Literal1.Text = "<h2> Database connection error.</h2>"
                Exit Sub
            End If
            con.Open()
            Dim qry As String = "select * from faculty"
            Dim com As New SqlCommand(qry, con)
            Dim dr As SqlDataReader = com.ExecuteReader()
            DropDownList1.Items.Clear()
            DropDownList1.Items.Add("-select fid-")
            While dr.Read()
                DropDownList1.Items.Add(dr("fid"))
            End While
            con.Close()
        End If
    End Sub
End Class
