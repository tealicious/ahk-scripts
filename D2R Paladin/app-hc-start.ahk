; ============================================================================
; INITIALIZATION
; ============================================================================

#NoEnv ; improves performance
SendMode Input ; improves reliability
#IfWinActive, Diablo II: Resurrected ; suspend outside of client

    #Include utils/vars-conv-support.ahk
    #Include utils/base.ahk

    ; =============================================
    ; Player equipment configuration
    ; =============================================
    callToArmsEquipped := false
    holyShieldOnSwapHand := false
    #Include utils/hd-cast-buffs.ahk

    #Include utils/merc-heal-mouse-wheel.ahk
    #Include hardcore/exit-game.ahk

    auraToggle := !auraToggle

    ~LButton::
        if (!auraToggle) {
            Send %conviction%
        } else {
            Send %holyShock%
        }
    return

    ; holy shock while space is pressed
    ~Space::
        Send %holyShock%
    return

    ; conviction when running
    ~Space up::
        if (!auraToggle) {
            Send %conviction%
        } else {
            Send %holyShock%
        }
    return

    XButton2::
        Send %cleansing%
    return

    XButton1::
        auraToggle := !auraToggle
    return

    ;charge with right click
    ~RButton::
        Send %charge%
    return

    ~RButton up::
        if (!auraToggle) {
            Send %conviction%
        } else {
            Send %holyShock%
        }
    return