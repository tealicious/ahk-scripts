;charge with right click
~LButton & RButton::
    Send %charge%
    Send {Space down}
    sendDefaultAura()
return

~LButton & RButton up::
    Send {Space up}
    Send %blessedHammer%
return