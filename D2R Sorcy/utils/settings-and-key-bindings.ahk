; =============================================
; Left Click Key Bindings
; =============================================
spellPrimary = {F2} ; place this on the left click action slot

; =============================================
; Right Click Key Bindings
; =============================================
teleport = {F1}
spellSecondary = {F3}
spellTertiary = {F4}
townPortal = {F5}
frozenArmor = {F6}
clickRunStart = {Ctrl down}
clickRunEnd = {Ctrl up}

; =============================================
; Move Weapon Swap to Y
; =============================================
defaultWeaponSwap = {Y} ;move weapon swap off W so we can use that key for self-buffing

; =============================================
; Cooldowns and Timeouts
; =============================================
buffDelay := 500 ; in milliseconds
weaponSwapDelay := 333 ; in milliseconds
teleportDelay := 500 ; in milliseconds
hotkeyDelay := 1 ; in milliseconds

sendDefaultRightClick() {
    global auraToggle, teleport, spellSecondary
    if (!auraToggle) {
        Send %teleport%
    } else {
        Send %spellSecondary%
    }
}
