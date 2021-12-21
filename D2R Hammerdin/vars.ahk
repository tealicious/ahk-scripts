concentration = {F1}
itemTeleport = {F2}
redemption = {F3}
vigor = {F4}
holyShield = {F5}
charge = {F6}
cleansing = {F7}
townPortal = {F8}
battleCommand = {F9}
battleOrders = {F10}
defaultWeaponSwap = {Y}

hotkeyDelay := 1 ; in milliseconds

BlockKeyboard(state){
    Loop, 512
    {
        Key := Format("SC{:X}",A_Index)
        If (state = "On")
            Hotkey, *%Key%, KeyboardKey, On UseErrorLevel
        else
            Hotkey, *%Key%, KeyboardKey, Off UseErrorLevel
    }
    KeyboardKey:
    return
}

buffDelay := 500 ; in milliseconds
weaponSwapDelay := 150 ; in milliseconds
teleportDelay := 500 ; in milliseconds