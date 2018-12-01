Imports System.Data
Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class DataBaseConnection
    Public Shared Function getDBConnection() As SqlConnection
        Dim con As SqlConnection = Nothing
        Try
            con = New SqlConnection("data source=APEX-PC\SQLEXPRESS;initial catalog=automationexamdb;integrated security=true")
        Catch ex As Exception
            con = Nothing
        End Try
        Return con
    End Function
End Class
