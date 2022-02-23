#Include utils/init.ahk

; =============================================
; Player equipment configuration
; =============================================
hardcoreCharacter := true

#Include _vars.ahk
#Include utils/base.ahk
#Include utils/click-run.ahk
#Include utils/cast-buffs.ahk
if (hardcoreCharacter) {
    #Include hardcore/exit-game.ahk
}