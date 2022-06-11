#NoEnv ; improves performance
SendMode Input ; improves reliability
#IfWinActive, Diablo II: Resurrected ; suspend outside of client

global hardcoreCharacter := true

; zeal = {F1}
; charge = {F2}
; mainAura = {F3} ; holy fire/ice/lit
holyShield = {F4}
clickRunStart = {Ctrl down}
clickRunEnd = {Ctrl up}

; ~LButton & RButton::
;     Send %charge%
;     Send {Shift down}
;     Send %mainAura%
; return

; ~LButton & RButton up::
;     Send {Shift up}
;     Send %zeal%
; return

; ~LButton::
;     Send %mainAura%
; return

~LButton & RButton::
    Send %clickRunStart%
return

~LButton & RButton up::
    Send %clickRunEnd%
return

W::
    Send %holyShield%
    Click right
    Send %mainAura%
return



#Include hardcore/exit-game.ahk
