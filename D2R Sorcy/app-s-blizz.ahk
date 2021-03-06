#Include utils/init.ahk

; =============================================
; Player equipment configuration
; =============================================
callToArmsEquipped := false
global energyShield := false
global hardcoreCharacter := false
auraToggle := !auraToggle
global mercenaryPotionColumnCount := 3
global castingDelay = 1800

#Include _vars.ahk
#Include utils/base.ahk
#Include utils/_spell-cycle.ahk
#Include utils/frozen-armor.ahk
#Include utils/click-tele.ahk
#Include utils/merc-heal-single-button.ahk
#Include utils/telekinesis.ahk
#Include utils/blizz-blast-combo.ahk