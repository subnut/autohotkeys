#Requires AutoHotKey v2
#SingleInstance off
WinTitle := A_ScriptDir "\" RegExReplace(A_ScriptName, "\....$")
WM_CLOSE := 0x0010

OG_TitleMatchMode	        := A_TitleMatchMode
OG_DetectHiddenWindows 	  := A_DetectHiddenWindows
DetectHiddenWindows True  ; MOST IMPORANT SETTING
SetTitleMatchMode 1       ; 3 = must match exactly
                          ; 1 = must start with

; Alter WinTitle
OG_WinTitle := WinGetTitle(A_ScriptHwnd)
WinSetTitle "[EXCLUDED] " OG_WinTitle, A_ScriptHwnd

; Check for other running instances
if WinExist(WinTitle,, "[EXCLUDED]") ; ExcludeTitle doesn't support ahk_id
{
  PostMessage WM_CLOSE
  WinWaitClose ,,5
  if WinExist() {
    MsgBox "Unable to close running script. Exiting."
    ExitApp
  }
}

; Reset WinTitle
WinSetTitle OG_WinTitle, A_ScriptHwnd

; Restore settings that we'd changed to allow us to find running scripts
SetTitleMatchMode OG_TitleMatchMode
DetectHiddenWindows OG_DetectHiddenWindows
