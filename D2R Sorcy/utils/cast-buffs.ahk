W::
    castBuffs()
return

castBuffs() {
    global holyShieldOnSwapHand, callToArmsEquipped, defaultWeaponSwap, weaponSwapDelay
    BlockKeyboard("On")
    if (callToArmsEquipped) {

        Send {Numpad2}
        if (holyShieldOnSwapHand) { 
            toggleWeapon()
            castBattleOrders()
            ;buff line here
            toggleWeapon()

        } else {
            toggleWeapon()
            castBattleOrders()
            toggleWeapon()
            ;buff line here
        }

    } else {

        if (holyShieldOnSwapHand) {
            toggleWeapon()
            ;buff line here
            toggleWeapon()
        } else {
            ;buff line here
        }

    }
    BlockKeyboard("off")
}

toggleWeapon() {
    global defaultWeaponSwap, weaponSwapDelay
    Send %defaultWeaponSwap%
    Sleep, %weaponSwapDelay%
}

castBattleOrders() {
    global battleCommand, battleOrders, buffDelay
    Send %battleCommand%
    Click right
    Sleep, %buffDelay%
    Click right
    Sleep, %buffDelay%

    Send %battleOrders%
    Click right
    Sleep, %buffDelay%
    Click right
    Sleep, %buffDelay% 
}

castFrozenArmor() {

}