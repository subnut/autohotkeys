#Requires AutoHotKey v2
#include lib/elevate.ahk
#include lib/single_instance.ahk

; Win+Q closes window
#Q::
{
	if WinActive("ahk_exe Discord.exe")
		WinClose
	else
		Send "!{F4}"
}

; Win+Tab, Win+Shift+Tab to move through desktops
#Tab::Send "^#{Right}"
+#Tab::Send "^#{Left}"

; Since Win+Tab has been remapped, use Win+Ctrl+Tab instead
^#Tab::Send "#{Tab}"

; Win+F to Fullscreen
#F::Send "{F11}"
