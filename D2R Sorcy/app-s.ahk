#Include utils/init.ahk

; =============================================
; Player equipment configuration
; =============================================
callToArmsEquipped := false
hardcoreCharacter := false
auraToggle := !auraToggle

#Include vars.ahk
#Include utils/base.ahk
#Include utils/frozen-armor.ahk
#Include utils/click-run.ahk
#Include utils/space-tele.ahk
#Include utils/merc-heal-mouse-wheel.ahk
if (hardcoreCharacter) {
    #Include hardcore/exit-game.ahk
}