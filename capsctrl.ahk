#Requires AutoHotKey v2
#include lib/elevate.ahk
#include lib/single_instance.ahk

; CapsLock is Left control
CapsLock::LCtrl
CapsLock up::
{
  Send "{LCtrl up}"
  if (A_TimeSincePriorHotkey < 250)
    Send "{Blind}{CapsLock}"
}

; The following is old AHKv1 code
; It hasn't been updated to AHKv2 syntax
;
; if (A_TimeSincePriorHotkey < 150)
;   SetCapsLockState % !GetKeyState("CapsLock", "T")
