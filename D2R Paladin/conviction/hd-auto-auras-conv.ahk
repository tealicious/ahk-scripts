~LButton::
    if (!auraToggle) {
        Send %conviction%
    } else {
        Send %vigor%
    }
    Send %blessedHammer%
return

; concentration when casting hammers standing still
~Space::
    Send %concentration%
return

; redemption when not casting hammers
~Space up::
    Send %redemption%
return

XButton2::
    Send %cleansing%
return

XButton1::
    auraToggle := !auraToggle
return