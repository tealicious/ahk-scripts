; ================================================================
; Left Click Key Bindings
; ================================================================
global blessedHammer = "{F1}"
global charge = "{F2}" 

; ================================================================
; Right Click Key Bindings
; ================================================================
global concentration = "{F3}"
global primaryAura = "{F4}" ; usually VIGOR/CONVICTION
global secondaryAura = "{F5}" ; for toggling to later, CLEANSING is good here (removes status effects quickly)
global tertiaryAura = "{F6}" ; third aura option for single key bind
global redemption = "{F7}" ; gets turned on when you pick up your hammers for auto-helth and mana bumps
global holyShield = "{F8}"
global townPortal = "{F9}"
global itemTeleport = "{F10}" ; teleport ability from staffs / amus / enigma
global battleCommand = "{F11}" ; if you've bought a CTA
global battleOrders = "{F12}" ; if you've bought a CTA

; ================================================================
; Move Weapon Swap to Y
; ================================================================
global defaultWeaponSwap = "{Y}" ; move weapon swap off W so we can use that key for self-buffing

; ================================================================
; Travy bot stuff
; ================================================================
global forceMove = "{M}"
global forceMoveStart = "{M down}"
global forceMoveEnd = "{M up}"
global showLoot = "{L}"

; ===================================================================================
; Cooldowns and Timeouts and other shit you dont need to fuck with (unless you do :P)
; ===================================================================================
global characterLoadScreenTime := 3250
global buffDelay := 500 ; in milliseconds
global weaponSwapDelay := 250 ; in milliseconds
global teleportDelay := 500 ; in milliseconds
global hotkeyDelay := 1 ; in milliseconds

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

