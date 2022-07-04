global breakLoop = 0

orbBlast() {
    send {Space down}
    Click, left
    sleep 50
    Click, down right
    sleep %castingDelay%
    Click, up right
    Sleep 250
}

resetKeyState() {
    Send {Space up}
    Click, up right
}

keepItMovin() {
    sleep 1
    Click, down left
}

loopOrbBlast() {
    breakLoop = 0
    Loop, 
    {
        if (breakLoop = 1) {
            resetKeyState()
            break 
        } else if (breakLoop = 2) {
            resetKeyState()
            keepItMovin()
            break 
        }
        orbBlast()
    }
}

~Space & LButton::
    loopOrbBlast()
return

~LButton & Space::
    loopOrbBlast()
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