; =============================================
; Left Click Key Bindings
; =============================================
global spellPrimary = "{F2}" ; place this on the left click action slot

; =============================================
; Right Click Key Bindings
; =============================================
teleport = {F1}
global spellSecondary = "{F3}"
global spellTertiary = "{F4}"
global spellFour = "{F5}"
global spellFive = "{F6}"
townPortal = {F7}
global frozenArmor = "{F8}"
telekinesis = {F9}
global energyShield = "{F10}"
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
global currentSpell = spellSecondary
global potionIdx := 1

; sendDefaultRightClick() {
;     global auraToggle, teleport, spellSecondary
;     if (!auraToggle) {
;         Send %teleport%
;     } else {
;         Send %spellSecondary%
;     }
; }
