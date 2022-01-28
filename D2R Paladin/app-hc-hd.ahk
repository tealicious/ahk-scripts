; ============================================================================
; INITIALIZATION
; ============================================================================

#NoEnv ; improves performance
SendMode Input ; improves reliability
#IfWinActive, Diablo II: Resurrected ; suspend outside of client

    #Include utils/vars.ahk
    #Include utils/base.ahk
    #Include utils/hd-auto-auras.ahk
    #Include utils/hd-holyshield-swap.ahk
    ;#Include utils/hd-holyshield-simple.ahk
    #Include utils/hd-click-charge.ahk
    ; #Include hd-click-tele.ahk
    #Include utils/merc-heal-mouse-wheel.ahk
    #Include hardcore/exit-game.ahk