#NoEnv
SendMode Input
#IfWinActive, Diablo II: Resurrected

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
    prayer = {F11}
    forceMove = {F12}
    buffDelay := 500 ; in milliseconds
    weaponSwapDelay := 150 ; in milliseconds
    teleportDelay := 500 ; in milliseconds

    CoordMode, Mouse, Screen

    Del::
        Reload
    return

    M::
        runTravincal()
    return 

    startGame() {
        MouseMove, (A_ScreenWidth // 2) - 100, (A_ScreenHeight - 100)
        Click, Left
        Sleep, 100
        MouseMove, (A_ScreenWidth // 2) , (A_ScreenHeight // 2) + 50
        Click, Left
        Sleep, 3000
    }

    runTravincal() {
        global vigor
        Send {G}
        Sleep, 666
        castHolyShield()
        Sleep, 333
        Send %vigor%

        moveToCouncilSteps(46, 0)
        selfPot()
        hammers(10000)
        moveUpRight(300, 300)
        selfPot()
        hammers(10000)
        moveUpRight(450, 250)
        moveUpRight(-240, 650)
        selfPot()
        hammers(10000)
        Send {G}
        Sleep, 300
        Send {~}
        Sleep, 10
        Reload

    }

    moveUpRight(right, top) {
        send {R}
        Sleep, 100
        MouseMove, (A_ScreenWidth // 2) + right , top
        Send {F12}
        Sleep, 2000
        Send {F12 up}
        send {R}
        Sleep, 100
    }

    moveLeft() {
        send {R}
        Sleep, 100
        MouseMove, 500, 375
        Send {F12 down}
        Sleep, 10
        Send {F12 up}
        send {R}
        Sleep, 1500
    }

    moveToCouncilSteps(vigorAdjust, armorAdjust) {
        MouseMove, (A_ScreenWidth - 470) , (A_ScreenHeight - 180)
        Send {F12 down}

        vigorAdjustedSleep(1200, vigorAdjust, armorAdjust)
        MouseMove, (A_ScreenWidth - 300) , 200

        vigorAdjustedSleep(1595, vigorAdjust, armorAdjust)
        MouseMove, (A_ScreenWidth - 300) ,500

        vigorAdjustedSleep(2175, vigorAdjust, armorAdjust)
        MouseMove, (A_ScreenWidth - 300) ,580

        vigorAdjustedSleep(1500, vigorAdjust, armorAdjust)
        MouseMove, (A_ScreenWidth - 270) ,900

        vigorAdjustedSleep(3500, vigorAdjust, armorAdjust)

        Send {F12 up}

        Sleep, 100
    }

    moveToCouncilInterior(vigorAdjust, armorAdjust) {
        MouseMove, (A_ScreenWidth - 470) , (A_ScreenHeight - 180)
        Send {F12 down}

        vigorAdjustedSleep(1200, vigorAdjust, armorAdjust)
        MouseMove, (A_ScreenWidth - 300) , 200

        vigorAdjustedSleep(1595, vigorAdjust, armorAdjust)
        MouseMove, (A_ScreenWidth - 300) ,500

        vigorAdjustedSleep(2175, vigorAdjust, armorAdjust)
        MouseMove, (A_ScreenWidth - 300) ,580

        vigorAdjustedSleep(1500, vigorAdjust, armorAdjust)
        MouseMove, (A_ScreenWidth - 270) ,900

        vigorAdjustedSleep(3400, vigorAdjust, armorAdjust)
        MouseMove, (A_ScreenWidth - 280) ,50

        vigorAdjustedSleep(3400, vigorAdjust, armorAdjust)
        Send {F12 up}

        Sleep, 100
    }

    vigorAdjustedSleep(Sleeptime, vigorAdjust, armorAdjust) {
        effectiveRuneSpeed = ((6 + 4 * ((vigorAdjust / 100) + (armorAdjust * 150 / (armorAdjust + 150) / 100))) / 6)
        ;MsgBox % Sleeptime / ((6 + 4 * ((vigorAdjust / 100) + (armorAdjust * 150 / (armorAdjust + 150) / 100))) / 6)
        Sleep, Sleeptime / ((6 + 4 * ((vigorAdjust / 100) + (armorAdjust * 150 / (armorAdjust + 150) / 100))) / 6)
    }

    chargeAndReset() {
        global charge, concentration
        Send %charge%
        Click right
        Sleep, 1000
        Send %concentration%
    }

    castHolyShield() {
        global holyShield, buffDelay
        Send %holyShield%
        Click right
        Sleep, %buffDelay%
    }

    hammers(timeToCast) {
        global concentration, redemption
        ;MouseMove, (A_ScreenWidth // 2) , (A_ScreenHeight // 2)
        send %concentration%
        send {Shift Down}
        Click down left
        Sleep, timeToCast
        Click up left
        send {Shift Up}
        send %redemption%
        Sleep, 300
    }

    mercPot() {
        send {Shift Down}
        send 4
        send {Shift Up}
        Sleep, 10
    }

    selfPot() {
        send 1
        Sleep, 10
    }

    ~RButton::
        Send %charge%
    return

    ~RButton up::
        Send %vigor%
    return