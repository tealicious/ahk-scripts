; town portal
E::
    continueWalk = 0
    if (GetKeyState("LButton", "P"))
    {
        continueWalk = 1
    }
    BlockKeyboard("On")
    Send %townPortal%
    Sleep, 100
    Click down right
    Sleep, 100
    Send %redemption%
    BlockKeyboard("Off")
    If (continueWalk = 1)
    {
        Click down left
        Click up left
    }
return

; Suspend script (for typing in chat)
Enter::
    Suspend, Toggle
    Send {Enter}
return

; Re-enables script in case user escapes out of text window
Escape::
    Suspend, Off
    Send {Escape}
return

Del::
    Suspend, Toggle
return

XButton2::
    Send {P} 
return