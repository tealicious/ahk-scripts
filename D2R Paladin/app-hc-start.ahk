; ============================================================================
; INITIALIZATION
; ============================================================================

#NoEnv ; improves performance
SendMode Input ; improves reliability
#IfWinActive, Diablo II: Resurrected ; suspend outside of client

    #Include utils/vars.ahk
    #Include utils/base.ahk
    ~LButton::
        Send {F3}
    return
    #Include utils/hd-holyshield-simple.ahk
    #Include utils/merc-heal-mouse-wheel.ahk
    #Include utils/hd-click-charge.ahk
    ; #include utils/hd-weaponswap-tele.ahk
    #Include hardcore/exit-game.ahk