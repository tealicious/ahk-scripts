#Include hardcore/exit-game.ahk

; town portal
~E::
    x := (A_ScreenWidth // 2) - 50
    y := (A_ScreenHeight // 2) - 125
    Send %townPortal%
    CoordMode, Mouse, Screen
    MouseMove, x, y
    Sleep 1200
    Click left
return

; Suspend script (for typing in chat)
Enter::
    Suspend, Toggle
    Send {Enter}
return

Del::
    Suspend, Toggle
return

XButton2::
    Send {P} 
return