Module Module1

    Function hex2(ByVal s As Integer)
        Dim ret = Hex(s)
        If ret.Length < 2 Then
            ret = "0" & ret
        End If
        Return ret
    End Function

    Sub Main()
        Dim im As New Drawing.Bitmap("tiles.png")
        Dim g = Drawing.Graphics.FromImage(im)
        Dim asm = ""
        Dim charid = &H4E
        Dim append As New ArrayList()
        Dim ln = 0
        For i As Integer = 0 To im.Width Step 8
            asm &= "Char" & hex2(charid) & ":" & vbCrLf
            append.Clear()
            ln = 0
            Dim sthhappened = 0
            For x As Integer = 0 To 7
                sthhappened = 0
                For y As Integer = 0 To 7
                    Dim c = im.GetPixel(i + x, y)
                    If c.R = 0 And c.G = 0 And c.B = 0 Then
                        append.Add("$" & x & y)
                    End If
                    If c.R <> 255 Or c.G <> 255 Or c.B <> 255 Then
                        sthhappened = 1
                    End If
                Next
                If sthhappened <= 0 Then
                    Exit For
                End If
                ln += 1
                If append.Count > 0 Then
                    asm &= "    db " & Join(append.ToArray(), ",") & vbCrLf
                    append.Clear()
                End If
            Next
            asm &= "    db $ff,$" & hex2(ln) & vbCrLf & vbCrLf
            charid += 1
        Next
        Console.WriteLine(asm)
        My.Computer.Clipboard.SetText(asm)
    End Sub

End Module
