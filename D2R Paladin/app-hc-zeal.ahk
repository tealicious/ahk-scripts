; ============================================================================
; INITIALIZATION
; ============================================================================

#NoEnv ; improves performance
SendMode Input ; improves reliability
#IfWinActive, Diablo II: Resurrected ; suspend outside of client

    ; =============================================
    ; Player equipment configuration
    ; =============================================
    callToArmsEquipped := true
    holyShieldOnSwapHand := true

    #Include zeal/vars.ahk
    #Include utils/base.ahk
    #Include zeal/zeal-auto-auras.ahk
    #Include utils/hd-cast-buffs.ahk
    #Include utils/hd-click-charge.ahk
    #Include utils/merc-heal-mouse-wheel.ahk
    #Include hardcore/exit-game.ahk