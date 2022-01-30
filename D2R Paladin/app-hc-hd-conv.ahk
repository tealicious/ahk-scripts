; ============================================================================
; INITIALIZATION
; ============================================================================

#NoEnv ; improves performance
SendMode Input ; improves reliability
#IfWinActive, Diablo II: Resurrected ; suspend outside of client

    auraToggle := !auraToggle

    #Include utils/vars.ahk
    #Include utils/base.ahk
    #Include conviction/hd-auto-auras-conv.ahk

    ; =============================================
    ; Player equipment configuration
    ; =============================================
    callToArmsEquipped := true
    holyShieldOnSwapHand := true
    #Include utils/hd-cast-buffs.ahk

    #Include conviction/hd-click-charge-conv.ahk
    #Include utils/merc-heal-mouse-wheel.ahk
    #Include hardcore/exit-game.ahk