;charge with right click
~LButton & RButton::
    Send %charge%
    Send {Shift down}
    if (!auraToggle) {
        Send %conviction%
    } else {
        Send %vigor%
    }
return

~LButton & RButton up::
    Send {Shift up}
    Send %blessedHammer%
    ; if (!auraToggle) {
    ;     Send %conviction%
    ; } else {
    ;     Send %vigor%
    ; }
return