global auraToggle := !auraToggle
global secondaryAuraToggle := !secondaryAuraToggle
global usePrimaryAuraSet := true

sendDefaultAura() {

    if (usePrimaryAuraSet) {

        if (auraToggle) {
            Send %primaryAura%
        } else {
            Send %secondaryAura%
        } 

    } else {

        if (secondaryAuraToggle) {
            Send %tertiaryAura%
        } else {
            Send %redemption%
        } 

    }

}

XButton1::
    if (usePrimaryAuraSet) {
        auraToggle := !auraToggle
    }
    usePrimaryAuraSet := true
    sendDefaultAura()
return

XButton2::
    if (!usePrimaryAuraSet) {
        secondaryAuraToggle := !secondaryAuraToggle
    }
    usePrimaryAuraSet := false
    sendDefaultAura()
return
