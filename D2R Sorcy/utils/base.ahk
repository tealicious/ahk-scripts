; =============================================
; Used for more complex actions in other scripts
; =============================================
BlockKeyboard(state){
    Loop, 512
    {
        Key := Format("SC{:X}",A_Index)
        If (state = "On")
            Hotkey, *%Key%, KeyboardKey, On UseErrorLevel
        else
            Hotkey, *%Key%, KeyboardKey, Off UseErrorLevel
    }
    KeyboardKey:
    return
}

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
    sendDefaultRightClick()
    Click left
return

; Suspend script (for typing in chat)
Enter::
    Suspend, Toggle
    Send {Enter}
return

; Suspend script toggle
Del::
    Suspend, Toggle
return

XButton2::
    auraToggle := !auraToggle
    sendDefaultRightClick()
return