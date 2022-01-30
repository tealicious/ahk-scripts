W::
    castPalyBuffs()
return

castPalyBuffs() {
    global holyShieldOnSwapHand, callToArmsEquipped, defaultWeaponSwap, weaponSwapDelay
    BlockKeyboard("On")
    if (callToArmsEquipped) {

        Send {Numpad2}
        if (holyShieldOnSwapHand) { 
            toggleWeapon()
            castBattleOrdersWithHolyShield()
            toggleWeapon()

        } else {
            toggleWeapon()
            castBattleOrders()
            toggleWeapon()

            castHolyShield()
        }

    } else {

        if (holyShieldOnSwapHand) {
            toggleWeapon()
            castHolyShield()
            toggleWeapon()
        } else {
            castHolyShield()
        }

    }
    BlockKeyboard("off")
}

toggleWeapon() {
    global defaultWeaponSwap, weaponSwapDelay
    Send %defaultWeaponSwap%
    Sleep, %weaponSwapDelay%
}

castBattleOrdersWithHolyShield() {
    castBattleOrders()
    castHolyShield()
}

castHolyShield() {
    global holyShield, buffDelay
    Send %holyShield%
    Click right
    Sleep, %buffDelay%
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