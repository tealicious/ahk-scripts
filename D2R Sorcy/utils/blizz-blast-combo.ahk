global breakLoop = 0

blizzBlast() {
    Click, up left
    send {Space down}
    send %spellPrimary%
    sleep 100
    Click, right
    sleep 50
    Send %currentSpell%
    sleep 50
    Click, down right
    sleep %castingDelay%
    Click, up right
    sleep 250
}

resetKeyState() {
    Send {Space up}
    Click, up right
}

keepItMovin() {
    sleep 1
    Click, down left
}

loopBlizzBlast() {
    breakLoop = 0
    Loop, 
    {
        if (breakLoop = 1) {
            resetKeyState()
            break 
        }
        else if (breakLoop = 2) {
            resetKeyState()
            keepItMovin()
            break 
        }
        blizzBlast()
    }
}

; ~Space::
;     loopBlizzBlast()
; return

; ~Space up::
;     breakLoop = 1
; return


~Space & LButton::
    loopBlizzBlast()
return

~LButton & Space::
    loopBlizzBlast()
return

~LButton & Space up::
    breakLoop = 2
return

~Space & LButton up::
    breakLoop = 1
return

~Space up::
    breakLoop = 1
return

~LButton up::
    breakLoop = 1
return