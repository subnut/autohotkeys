#include lib/common.ahk

#SingleInstance Force
SetTitleMatchMode 3
delay = 100

#IfWinActive ahk_exe ONENOTE.EXE
PrintScreen::
	Send !d
	sleep %delay%
	Send p
return
+PrintScreen::
	Send !d
	sleep %delay%
	Send c
return
#IfWinActive
