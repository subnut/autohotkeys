#SingleInstance off
WinTitle := A_ScriptDir "\" RegExReplace(A_ScriptName, "\....$")
WM_CLOSE := 0x0010

OG_TitleMatchMode		:= A_TitleMatchMode
OG_DetectHiddenWindows 	:= A_DetectHiddenWindows
DetectHiddenWindows, On ; MOST IMPORANT SETTING
SetTitleMatchMode, 3



; Save current WinTitle for future use
WinGetTitle, OG_WinTitle, ahk_id %A_ScriptHwnd%

; Check if already running
if WinExist(WinTitle) {
  PostMessage, %WM_CLOSE%
  WinWaitClose,,, 5
  if WinExist() {
    MsgBox, Unable to close running script. Exiting.
    ExitApp
  }
}

; Set WinTitle now.
WinSetTitle, ahk_id %A_ScriptHwnd%,, %WinTitle%



; Restore settings that we'd changed to allow us to find running scripts
SetTitleMatchMode, %OG_TitleMatchMode%
DetectHiddenWindows, %OG_DetectHiddenWindows%
OG_DetectHiddenWindows =
OG_TitleMatchMode =
