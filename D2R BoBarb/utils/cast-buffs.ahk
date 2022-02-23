W::
    castBattleOrders()
return

castBattleOrders() {
    global battleCommand, battleOrders, buffDelay, shout
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

    Send %shout%
    Click right
    Sleep, %buffDelay%
    Click right
    Sleep, %buffDelay% 
}