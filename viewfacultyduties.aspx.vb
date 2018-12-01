Imports System.Data
Imports System.Data.SqlClient

Partial Class viewfacultyduties
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim con As SqlConnection = DataBaseConnection.getDBConnection()
        If con Is Nothing Then

        End If

        Dim qry = "select A.*,B.*,C.* from rooms A, duties B, faculty C where A.roomid=B.roomid and B.fid=C.fid and C.fid='" & Session("fid") & "'"
        Literal1.Text = qry
        Dim da As New SqlDataAdapter(qry, con)
        Dim ds As New DataSet()
        ds.Clear()
        da.Fill(ds, "A")

        GridView1.DataSource = ds
        GridView1.DataMember = "A"
        GridView1.DataBind()

    End Sub
End Class
