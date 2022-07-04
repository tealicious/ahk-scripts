
~WheelUp:: 
    Send % KeyCycle("Up")
return

~WheelDown::
    Send % KeyCycle("Down")
return

KeyCycle(dir)
{
    ; keys := [primaryAura, secondaryAura, tertiaryAura]
    ; keys := [primaryAbility, secondaryAbility]
    keys := [primaryAbility]
    static Time := A_TickCount , Pos := 0
    if (dir = "Up") && (Pos = keys.MaxIndex())
        Pos := 1
    else if (dir = "Down") && (Pos = 1 || Pos = 0)
        Pos := keys.MaxIndex()
    else if (dir = "Up")
        Pos++
    else
        Pos--
    currentAubility := keys[Pos]
return keys[Pos]
}

sendDefaultAbility() {
    Send %currentAbility%
}
