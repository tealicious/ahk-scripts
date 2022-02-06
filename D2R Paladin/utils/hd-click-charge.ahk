;charge with right click
~LButton & RButton::
    Send %charge%
    Send {Shift down}
    sendDefaultAura()
return

~LButton & RButton up::
    Send {Shift up}
    Send %blessedHammer%
return