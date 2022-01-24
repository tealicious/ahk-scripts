~W::
    continueWalk = 0
    if (GetKeyState("LButton", "P"))
    {
        continueWalk = 1
    }
    BlockKeyboard("On")

    Send %defaultWeaponSwap%
    Sleep, %weaponSwapDelay%

    Send %holyShield%
    Click right
    Sleep, %buffDelay%

    Send %defaultWeaponSwap%

    BlockKeyboard("Off")
    If (continueWalk = 1)
    {
        Click down left
    }
return