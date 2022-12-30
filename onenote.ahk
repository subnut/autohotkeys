#include lib/common.ahk
SetTitleMatchMode 3

#IfWinActive ahk_exe ONENOTE.EXE
PrintScreen::
	Send !d
	sleep 200
	Send p
return
+PrintScreen::
	Send !d
	sleep 200
	Send c
return
#IfWinActive