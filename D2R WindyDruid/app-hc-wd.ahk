secondsTilHurricane = 16 ; just plain old seconds
townPortal = {F9} ; what key is town portal assigned to

; ============================================================================
; INITIALIZATION
; ============================================================================

#NoEnv ; improves performance
SendMode Input ; improves reliability
Thread, interrupt, 0 ; Make all threads always-interruptible.
#IfWinActive, Diablo II: Resurrected ; suspend outside of client

    ; ============================================================================
    ; auto-hurricane
    ; ============================================================================

    secondsTilHurricane := secondsTilHurricane * 1000

    F8::
        alt := !alt
        If (alt)
        {
            castHurricane()
            SetTimer, castHurricane, %secondsTilHurricane%
        }
        Else
        {
            SetTimer, castHurricane, Off
        }
    return

    castHurricane(){
        Send {F8}
    return
}

; ============================================================================
; auto-exit
; ============================================================================

promptUser() {
    MsgBox AutoHotkey script has been suspended, press Delete or Enter to resume script.
    Suspend, on
}

~Esc::
    Suspend, off
    Send {Down}
    Send {Down}
    Send {Up}
    Send {Enter}
    promptUser()
return

; ============================================================================
; common
; ============================================================================

; town portal
R::
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

