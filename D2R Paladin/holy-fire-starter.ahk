#Include utils/init.ahk

global hardcoreCharacter := true

zeal = {F1}
charge = {F2}
mainAura = {F3} ; holy fire

~LButton & RButton::
    Send %charge%
    Send {Shift down}
    Send %mainAura%
return

~LButton & RButton up::
    Send {Shift up}
    Send %zeal%
return

~LButton::
    Send %mainAura%
return

#Include hardcore/exit-game.ahk
