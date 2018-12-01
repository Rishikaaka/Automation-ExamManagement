Imports System.Data.SqlClient
Imports System.Data

Partial Class generateduties
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim freefaculty As New ArrayList()
        Dim freerooms As New ArrayList()
        Dim examstuds As New ArrayList()
        Dim coursecodes As New ArrayList()
        Dim examtimetable As New ArrayList()
        Dim con As SqlConnection = DataBaseConnection.getDBConnection()
        If con Is Nothing Then
            Literal1.Text = "<h2> Database connection error.</h2>"
            Exit Sub
        End If
        con.Open()
        If DropDownList1.SelectedIndex = 0 Then
            Literal1.Text = "<h3>select session</h3>"
            Exit Sub
        End If

        Dim qry = ""
        If DropDownList1.SelectedIndex = 1 Then
            qry = "select * from timetable where class2='-' and class3='-' and class4='-'"
        Else
            qry = "select * from timetable where class5='-' and class6='-' and class7='-'"
        End If

        Dim com As New SqlCommand(qry, con)
        Dim dr As SqlDataReader = com.ExecuteReader()
        Literal1.Text = ""
        While dr.Read()
            Literal1.Text = Literal1.Text & dr("fid") & "-" & dr("day") & "<br>"
            freefaculty.Add(dr("fid") & "-" & dr("day"))
        End While
        con.Close()

        Dim con1 As SqlConnection = DataBaseConnection.getDBConnection()
        If con1 Is Nothing Then
            Literal1.Text = "<h2> Database connection error.</h2>"
            Exit Sub
        End If
        con1.Open()

        Dim qry1 = "select * from rooms where roomid in (select distinct roomid from courses A,examtimetable B where A.coursecode like B.branch+'-'+CONVERT(varchar(10), B.year)+'-'+Convert(varchar(4),B.sem)+'%')"

        Dim com1 As New SqlCommand(qry1, con1)
        Dim dr1 As SqlDataReader = com1.ExecuteReader()
        Literal1.Text = ""
        While dr1.Read()
            ' Literal1.Text = Literal1.Text & dr1("roomid") & "-" & dr1("block") & "-" & dr1("roomno") & "-" & dr1("capacity") & "<br>"
            freerooms.Add(dr1("roomid") & "-" & dr1("block") & "-" & dr1("roomno") & "-" & dr1("capacity"))
        End While
        con1.Close()

        Dim con2 As SqlConnection = DataBaseConnection.getDBConnection()
        If con2 Is Nothing Then
            Literal1.Text = "<h2> Database connection error.</h2>"
            Exit Sub
        End If
        con2.Open()

        Dim qry2 = "select sid,coursecode from student where coursecode in(select distinct coursecode from courses A,examtimetable B where A.coursecode like B.branch+'-'+CONVERT(varchar(10), B.year)+'-'+Convert(varchar(4),B.sem)+'%');"
        Dim com2 As New SqlCommand(qry2, con2)
        Dim dr2 As SqlDataReader = com2.ExecuteReader()
        'Literal1.Text = ""
        While dr2.Read()
            ' Literal1.Text = Literal1.Text & dr2("sid") & "-" & dr2("coursecode") & "<br>"
            examstuds.Add(dr2("sid") & "-" & dr2("coursecode"))
            If Not coursecodes.Contains(dr2("coursecode")) Then
                coursecodes.Add(dr2("coursecode"))
            End If
        End While
        con1.Close()

        examstuds.Sort()


        Dim con3 As SqlConnection = DataBaseConnection.getDBConnection()
        con3.Open()



        ' Literal1.Text = "Course codes :"
        Dim s As String
        Literal2.Text = ""
        For Each s In freerooms
            Literal2.Text = Literal2.Text & "-" & s & "<br>"
        Next

        Dim examrooms As New ArrayList()

        Dim completed As Boolean = False

        For Each s In coursecodes
            'Literal1.Text = Literal1.Text & " " & s
            Dim studyear As String = s.Substring(4, 1)
            'Literal1.Text = Literal1.Text & " " & studyear
            If studyear.Equals("1") Then
                Dim freeroom As String
                For Each freeroom In freerooms
                    Dim roomsplit() As String = Split(freeroom, "-")

                    Dim qry3 = "insert into seatallots(roomid,sids) values (" & roomsplit(0)
                    examrooms.Add(roomsplit(0))
                    Dim i As Integer
                    Dim sids As String = ""
                    For i = 1 To Integer.Parse(roomsplit(3))
                        If examstuds.Count > 0 Then
                            Dim stud() As String = Split(examstuds(0), "-")
                            sids = sids & stud(0) & ","
                            examstuds.RemoveAt(0)
                            If examstuds.Count = 0 Then
                                Exit For
                            End If
                        Else
                            completed = True
                        End If
                    Next
                   
                    qry3 = qry3 & ",'" & sids & "')"
                    Dim com3 As New SqlCommand(qry3, con3)
                    Dim n = com3.ExecuteNonQuery()
                    If completed = True Then
                        Exit For
                    End If
                Next
            End If
            If completed = True Then
                Exit For
            End If
        Next

        Dim con4 As SqlConnection = DataBaseConnection.getDBConnection()
        con4.Open()
        Dim qry4 = "select day from examtimetable"
        Dim com4 As New SqlCommand(qry4, con4)
        Dim dr4 As SqlDataReader = com4.ExecuteReader()

        While dr4.Read()
            examtimetable.Add(dr4("day"))
        End While
        con4.Close()


        Dim con5 As SqlConnection = DataBaseConnection.getDBConnection()
        con5.Open()

        Dim room As String
        Dim faculty As String
        Dim examday As String


        For Each examday In examtimetable
            Dim i As Integer = 0

            For Each faculty In freefaculty
                'If faculty.Split("-")(1).Equals(examday) Then
                Dim days As String = faculty.Split("-")(1)
                TextBox1.Text = days & "-" & examday
                If String.Equals(examday, days, StringComparison.OrdinalIgnoreCase) Then
                    TextBox1.Text = "BB"
                    If i = examrooms.Count Then
                        Exit For
                    Else
                        TextBox1.Text = "B"
                        Dim qry5 = "insert into duties values('" & faculty.Split("-")(0) & "'," & examrooms(i) & ",'" & examday & "')"
                        Literal2.Text = Literal2.Text & "<br>" & qry5
                        Dim com5 As New SqlCommand(qry5, con5)
                        Dim n = com5.ExecuteNonQuery()
                        i = i + 1
                    End If
                End If
            Next

        Next
        con5.Close()
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim con1 As SqlConnection = DataBaseConnection.getDBConnection()
        If con1 Is Nothing Then
            Literal1.Text = "<h2> Database connection error.</h2>"
            Exit Sub
        End If
        con1.Open()

        Dim qry1 = "select * from rooms where roomid in (select distinct roomid from courses A,examtimetable B where A.coursecode like B.branch+'-'+CONVERT(varchar(10), B.year)+'-'+Convert(varchar(4),B.sem)+'%')"
        Dim com1 As New SqlCommand(qry1, con1)
        Dim dr1 As SqlDataReader = com1.ExecuteReader()
        Literal1.Text = ""
        While dr1.Read()
            Literal1.Text = Literal1.Text & dr1("roomid") & "-" & dr1("block") & "-" & dr1("roomno") & "-" & dr1("capacity") & "<br>"
        End While
        con1.Close()
    End Sub

    Protected Sub CheckBoxList3_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxList3.SelectedIndexChanged
        If CheckBoxList3.Items(0).Selected Then
            CheckBoxList3.Items(1).Selected = False
        ElseIf CheckBoxList3.Items(1).Selected Then
            CheckBoxList3.Items(0).Selected = False
        End If
    End Sub
End Class
