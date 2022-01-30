; ============================================================================
; INITIALIZATION
; ============================================================================

#NoEnv ; improves performance
SendMode Input ; improves reliability
#IfWinActive, Diablo II: Resurrected ; suspend outside of client

    #Include utils/vars.ahk
    #Include utils/base.ahk
    #Include utils/hd-auto-auras.ahk

    ; =============================================
    ; Player equipment configuration
    ; =============================================
    callToArmsEquipped := true
    holyShieldOnSwapHand := true
    #Include utils/hd-cast-buffs.ahk

    #Include utils/hd-click-charge.ahk
    #Include utils/merc-heal-mouse-wheel.ahk
    #Include hardcore/exit-game.ahk