
~WheelUp:: 
    if (telekinesisRing) {
        Send %telekinesis%
        Click Right
        sendDefaultAura()
        return
    } else {
        Send % KeyCycle("Up")
    }
return


~WheelDown::Send % KeyCycle("Down")

KeyCycle(dir)
{
    ; keys := [primaryAura, secondaryAura, tertiaryAura]
    keys := [primaryAura, secondaryAura]
    static Time := A_TickCount , Pos := 0
    if (dir = "Up") && (Pos = keys.MaxIndex())
        Pos := 1
    else if (dir = "Down") && (Pos = 1 || Pos = 0)
        Pos := keys.MaxIndex()
    else if (dir = "Up")
        Pos++
    else
        Pos--
    currentAuara := keys[Pos]
    return keys[Pos]
}

sendDefaultAura() {
    Send %currentAuara%
}
