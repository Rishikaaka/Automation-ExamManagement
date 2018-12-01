Imports System.Data.SqlClient
Imports System.Data
Partial Class generateduties234
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
            Literal1.Text = Literal1.Text & dr2("sid") & "-" & dr2("coursecode") & "<br>"
            examstuds.Add(dr2("sid") & "-" & dr2("coursecode"))
            If Not coursecodes.Contains(dr2("coursecode").ToString().Split("-")(0)) Then
                coursecodes.Add(dr2("coursecode").ToString().Split("-")(0))
            End If
        End While
        con1.Close()

        examstuds.Sort()

        Literal1.Text = Literal1.Text & "<br> <br>  No. of students =" & examstuds.Count
        Dim i, j As Integer
        Dim studbranchwise(coursecodes.Count-1) As ArrayList
        For i = 0 To coursecodes.Count - 1
            studbranchwise(i) = New ArrayList()
            studbranchwise(i).Add(coursecodes(i).ToString().Split("-")(0))  'studbranchwise first element contains 
            '' coursecode which should not be consider when process this
        Next


        For Each student In examstuds
            Dim subcode() As String = student.ToString().Split("-")
            For j = 0 To coursecodes.Count - 1
                Literal1.Text = Literal1.Text & "#" & subcode(1) & "$" & studbranchwise(0)(0) & "#"
                'Dim studsubcode() As String=studbranchwise(j)
                If studbranchwise(j)(0).ToString().Contains(subcode(1)) Then
                    Literal1.Text = Literal1.Text & "#"
                    studbranchwise(j).Add(student)
                    Exit For
                ElseIf studbranchwise(j)(0).Contains(subcode(1)) Then
                    studbranchwise(j).Add(student)
                    Literal1.Text = Literal1.Text & "#"
                    Exit For
                ElseIf studbranchwise(j)(0).Contains(subcode(1)) Then
                    studbranchwise(j).Add(student)
                    Literal1.Text = Literal1.Text & "#"
                    Exit For
                ElseIf studbranchwise(j)(0).Contains(subcode(1)) Then
                    Literal1.Text = Literal1.Text & "#"
                    studbranchwise(j).Add(student)
                    Exit For
                End If
            Next
        Next

        For i = 0 To coursecodes.Count - 1
            Literal1.Text = Literal1.Text & "<br><br><h1>New Branch</h1>"
            For Each s1 In studbranchwise(i)
                Literal1.Text = Literal1.Text & "<br>" & s1
            Next
        Next

        

        Dim con3 As SqlConnection = DataBaseConnection.getDBConnection()
        con3.Open()

        Dim studroomallot As New ArrayList
        Dim leftoverstuds As New ArrayList

        Literal1.Text = Literal1.Text & " count =" & studbranchwise.Count
        Dim k, l As Integer
        i = 0
        j = 1
        While i < studbranchwise.Count - 1 And j <= studbranchwise.Count - 1
            If studbranchwise.Count >= 2 Then
                k = 1
                l = 1
                While k < studbranchwise(i).Count And l < studbranchwise(j).Count
                    studroomallot.Add(studbranchwise(i)(k) & "," & studbranchwise(j)(l))
                    k = k + 1
                    l = l + 1
                End While

                If k < studbranchwise(i).Count Then
                    ''elements left
                    If i + 2 < studbranchwise.Count Then
                        While k < studbranchwise(i).Count
                            studroomallot.Insert(0, studbranchwise(i)(k))
                            k = k + 1
                        End While
                    Else
                        'Literal1.Text = Literal1.Text & "<br>No branch exist<br>"
                        While k < studbranchwise(i).Count
                            leftoverstuds.Add(studbranchwise(i)(k))
                            k = k + 1
                        End While
                    End If
                Else
                    ''elements completed
                    i = i + 2
                End If

                If l < studbranchwise(j).Count Then
                    ''elements left
                    'Literal1.Text = Literal1.Text & "<br>elements left<br>"
                    If j + 2 < studbranchwise.Count Then
                        'Literal1.Text = Literal1.Text & "<br>elements appending to next brach<br>"
                        While l < studbranchwise(j).Count
                            studroomallot.Insert(0, studbranchwise(j)(l))
                            l = l + 1
                        End While
                    Else
                        'Literal1.Text = Literal1.Text & "<br>No branch exist<br>"
                        While l < studbranchwise(j).Count
                            leftoverstuds.Add(studbranchwise(j)(l))
                            l = l + 1
                        End While
                    End If
                Else
                    j = j + 2
                End If
            End If
            For i = 0 To studroomallot.Count - 1
                Literal1.Text = Literal1.Text & "<br>" & studroomallot(i)
            Next
        End While
        Literal1.Text = Literal1.Text & "<br>Left over students<br><br>"
        For i = 0 To leftoverstuds.Count - 1
            Literal1.Text = Literal1.Text & " <br> " & leftoverstuds(i)
        Next

        Dim x = 1
        If x = 1 Then
            Exit Sub
        End If


        Dim examrooms As New ArrayList()
        Dim completed As Boolean = False

        Dim freeroom As String
            For Each freeroom In freerooms
                Dim roomsplit() As String = Split(freeroom, "-")

                Dim qry3 = "insert into seatallots(roomid,sids) values (" & roomsplit(0)
                examrooms.Add(roomsplit(0))

                Dim sids As String = ""
                For i = 1 To Integer.Parse(roomsplit(3))
                    If studroom.Count > 0 Then
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
                If completed = True Then
                    Exit For
                End If
                qry3 = qry3 & ",'" & sids & "')"
                Dim com3 As New SqlCommand(qry3, con3)
                Dim n = com3.ExecuteNonQuery()
            Next

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
            i = 0
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
End Class
