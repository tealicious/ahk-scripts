; battle order, battle commands, and holy shield with weapon-swapping
W::
    continueWalk = 0
    if (GetKeyState("LButton", "P"))
    {
        continueWalk = 1
    }
    BlockKeyboard("On")
    Send %defaultWeaponSwap%
    Sleep, %weaponSwapDelay%

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
    Send %holyShield%
    Click right
    Sleep, %buffDelay%

    Send %defaultWeaponSwap%
    Send %redemption%
    BlockKeyboard("Off")
    If (continueWalk = 1)
    {
        Click down left
    }
return