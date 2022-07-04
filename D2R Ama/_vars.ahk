; =============================================
; Left Click Key Bindings
; =============================================
melee = {F1}
ranged = {F2}

; =============================================
; Right Click Key Bindings
; =============================================
global primaryAbility = "{F3}" 
global secondaryAbility = "{F4}" 
global abilityThree = "{F5}" 
global abilityFour = "{F6}" 
townPortal = {F7}
global slowMissiles = "{F8}"
global itemTeleport = "{F10}" ; teleport ability from staffs / amus / enigma
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
global currentAbility := primaryAbility
global potionIdx := 1

; sendDefaultRightClick() {
;     global auraToggle, teleport, spellSecondary
;     if (!auraToggle) {
;         Send %teleport%
;     } else {
;         Send %spellSecondary%
;     }
; }
