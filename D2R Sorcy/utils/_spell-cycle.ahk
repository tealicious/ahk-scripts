; ~WheelUp::Send % KeyCycle("Up")
~WheelDown::Send % KeyCycle("Down")

KeyCycle(dir)
{
    keys := [spellSecondary, spellTertiary, spellFour, spellFive]
    static Time := A_TickCount , Pos := 0
    if (dir = "Up") && (Pos = keys.MaxIndex())
        Pos := 1
    else if (dir = "Down") && (Pos = 1 || Pos = 0)
        Pos := keys.MaxIndex()
    else if (dir = "Up")
        Pos++
    else
        Pos--
    currentSpell := keys[Pos]
    return keys[Pos]
}

sendDefaultRightClick() {
    Send %currentSpell%
}
