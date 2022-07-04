; tele
~RButton::
    if (enigma) { 
        Send %itemTeleport%
        sleep 25
        Click down right
    }
return

RButton up::
    if (enigma) { 
        Click up right
        sleep 25
        sendDefaultAura()
    }
return

MButton::
    Send {Shift down}
    Click right
    Send {Shift up}
return