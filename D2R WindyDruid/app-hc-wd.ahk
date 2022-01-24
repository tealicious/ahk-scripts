secondsTilHurricane = 16 ; just plain old seconds
townPortal = {E} ; what key is town portal assigned to

; ============================================================================
; INITIALIZATION
; ============================================================================

#NoEnv ; improves performance
SendMode Input ; improves reliability
#IfWinActive, Diablo II: Resurrected ; suspend outside of client

    ; ============================================================================
    ; auto-hurricane
    ; ============================================================================

    secondsTilHurricane := secondsTilHurricane * 1000

    F1::
        alt := !alt
        If (alt)
        {
            castHurricane()
            SetTimer, castHurricane, %secondsTilHurricane%
        }
        Else
        {
            Reload
        }
    return

    castHurricane(){
        continueWalk = 0
        if (GetKeyState("RButton", "P"))
        {
            continueWalk = 1
        }
        BlockKeyboard("On")
        Send {F1}
        BlockKeyboard("Off")
        If (continueWalk = 1)
        {
            Click down right
        }
    return
}

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

; ============================================================================
; auto-exit
; ============================================================================

5::
    Suspend, off
    Send {Esc}
    Send {Down}
    Send {Down}
    Send {Up}
    Send {Enter}
return

; ============================================================================
; common
; ============================================================================

; town portal
E::
    x := (A_ScreenWidth // 2) - 50
    y := (A_ScreenHeight // 2) - 125
    Send %townPortal%
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

F12::
    Suspend, Off
return

Del::
    Reload
    Suspend, On
return

; ============================================================================
; merc mousewheel heal
; ============================================================================

;heal merc with potion in row 1
WheelUp::
    Send {Shift Down}
    Send {1}
    Send {Shift Up}
return

;heal merc with potion in row 2
WheelDown::
    Send {Shift Down}
    Send {2}
    Send {Shift Up}
return

