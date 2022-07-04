W::
    castPalyBuffs()
    sendDefaultAura()
return

castPalyBuffs() {
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
    Send %defaultWeaponSwap%
    Sleep, %weaponSwapDelay%
}

castBattleOrdersWithHolyShield() {
    castBattleOrders()
    castHolyShield()
}

castHolyShield() {
    Send %holyShield%
    Click right
    Sleep, %buffDelay%
}

castBattleOrders() {
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