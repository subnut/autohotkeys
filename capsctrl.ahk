#include lib/common.ahk
#include lib/elevate.ahk
#include lib/single_instance.ahk

; CapsLock is Left control
CapsLock::LCtrl
CapsLock up::
  Send {LCtrl up}
  if (A_TimeSincePriorHotkey < 150)
    Send {Blind}{CapsLock}
; if (A_TimeSincePriorHotkey < 150)
;   SetCapsLockState % !GetKeyState("CapsLock", "T")
return
