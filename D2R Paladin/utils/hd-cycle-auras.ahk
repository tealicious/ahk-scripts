WheelUp::Send % KeyCycle("Up")
WheelDown::Send % KeyCycle("Down")
;global keys := ["{F4}","{F5}","{F6}", "{F7}"]
global keys := [primaryAura, secondaryAura, tertiaryAura]

KeyCycle(dir)
{
    static Time := A_TickCount , Pos := 0
    if (A_TickCount-Time >= 10000)
    {
        Pos := 1
        Time := A_TickCount
    }
    else if (dir = "Up") && (Pos = keys.MaxIndex())
        Pos := 1
    else if (dir = "Down") && (Pos = 1 || Pos = 0)
        Pos := keys.MaxIndex()
    else if (dir = "Up")
        Pos++
    else
        Pos--
    return keys[Pos]
}
