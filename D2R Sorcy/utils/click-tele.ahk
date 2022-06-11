; tele
RButton::
    GetKeyState, state, Space
    if (state = "D") {
        Send {Space down}
        Click, Right
    }
    else {
        Send %teleport%
        Click down right
    }
return

RButton up::
    Click up right
    sendDefaultRightClick()
return

; ~Space & RButton::
;     send {Shift down}
;     Click, down Right
; return

; ~Space & RButton up::
;     Click, up Right
; return

; ~Space up::
;     send {Shift up}
; return