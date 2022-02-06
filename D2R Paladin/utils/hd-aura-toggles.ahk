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