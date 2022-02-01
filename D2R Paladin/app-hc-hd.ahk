#Include utils/init.ahk

; =============================================
; Player equipment configuration
; =============================================
callToArmsEquipped := true
holyShieldOnSwapHand := true
hardcoreCharacter := true

#Include utils/settings-and-key-bindings.ahk
#Include utils/base.ahk
#Include utils/hd-auto-auras.ahk
#Include utils/hd-cast-buffs.ahk
#Include utils/hd-click-charge.ahk
#Include utils/merc-heal-mouse-wheel.ahk
if (hardcoreCharacter) {
    #Include hardcore/exit-game.ahk
}