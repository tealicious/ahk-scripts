; tele
RButton::
    if (enigma) { 
        Send %itemTeleport%
        Click down right
    }
return

RButton up::
    if (enigma) { 
        Click up right
        sendDefaultAura()
    }
return