; town portal
~E::
    Send %townPortal%
    Sleep, 100
    Click right
    x := (A_ScreenWidth // 2) - 50
    y := (A_ScreenHeight // 2) - 125
    CoordMode, Mouse, Screen
    MouseMove, x, y
    Sleep 1500
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