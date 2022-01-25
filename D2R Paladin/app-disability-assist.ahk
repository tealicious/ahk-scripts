#NoEnv
SendMode Input
#IfWinActive, Diablo II: Resurrected

    vigorRunBonus = 46
    armorRunBonus = 25

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

    ; concentration when casting hammers standing still
    ~Space::
        Send %concentration%
    return

    ; redemption when not casting hammers
    ~Space up::
        Send %redemption%
    return

    ~LButton::
        Send %vigor%
    return

    CoordMode, Mouse, Screen

    Del::
        Send {Shift Up}
        Send {F12 Up}
        Reload
    return

    ~Esc::
        restart()
        Sleep, 3000
        startGame()
        runKurast(vigorRunBonus, armorRunBonus)
        runTravincal(vigorRunBonus, armorRunBonus)
    return

    Enter::
        startGame()
        runKurast(vigorRunBonus, armorRunBonus)
        runTravincal(vigorRunBonus, armorRunBonus)
    return

    restart() {
        Send {Down}
        Send {Down}
        Send {Up}
        Send {Enter}
    }

    startGame() {
        Send {F12 up}
        Sleep, 100
        MouseMove, (A_ScreenWidth // 2) - 100, (A_ScreenHeight - 100)
        Click, Left
        Sleep, 100
        MouseMove, (A_ScreenWidth // 2) , (A_ScreenHeight // 2) + 50
        Click, Left
        Sleep, 4000
    }

    runKurast(vigorAdjust, armorAdjust) {
        global vigor
        Send {G}
        Sleep, 1000
        castHolyShield()
        Sleep, 500
        Send %vigor%

        MouseMove, (A_ScreenWidth - 325) , (A_ScreenHeight // 2) + 100
        Sleep, 100
        Send {F12}
        vigorAdjustedSleep(1400, vigorAdjust, armorAdjust)

        MouseMove, (A_ScreenWidth - 325) , 200
        Send {F12 down}
        vigorAdjustedSleep(4250, vigorAdjust, armorAdjust)

        MouseMove, (A_ScreenWidth - 300) , (A_ScreenHeight // 2) 
        vigorAdjustedSleep(5000, vigorAdjust, armorAdjust)

        Send {F12 up}

        Sleep, 100
        MouseMove, (A_ScreenWidth //2) - 250 , (A_ScreenHeight // 2) - 25
        Sleep, 100
        Click left
        Sleep, 500
        MouseMove, (A_ScreenWidth //2) - 520 , (A_ScreenHeight - 375)
        Click left
        Sleep, 1500
    }

    runTravincal(vigorAdjust, armorAdjust) {

        moveToCouncilSteps(vigorAdjust, armorAdjust)

        selfPot_1()
        hammers(8000)

        moveAlongSteps(300, 300, 1300)
        selfPot_2()
        hammers(8000)

        moveAlongSteps(450, 250, 1800)
        moveAlongSteps(-240, 650, 900)
        selfPot_3()
        hammers(8000)

        Sleep, 650
        moveAlongSteps(-100, (A_ScreenHeight // 2) + 50, 400)
        selfPot_4()
        hammers(8000)

        Send {~}
        Sleep, 10
        Reload
    }

    moveAlongSteps(right, top, sleepTime) {
        send {R}
        MouseMove, (A_ScreenWidth // 2) + right , top
        Sleep, 50
        Send {F12 down}
        Sleep, sleepTime
        Send {F12 up}
        send {R}
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

    vigorAdjustedSleep(Sleeptime, vigorAdjust, armorAdjust) {
        effectiveRuneSpeed = ((6 + 4 * ((vigorAdjust / 100) + (armorAdjust * 150 / (armorAdjust + 150) / 100))) / 6)
        ;MsgBox % Sleeptime / ((6 + 4 * ((vigorAdjust / 100) + (armorAdjust * 150 / (armorAdjust + 150) / 100))) / 6)
        Sleep, Sleeptime / ((6 + 4 * ((vigorAdjust / 100) + (armorAdjust * 150 / (armorAdjust + 150) / 100))) / 6)
    }

    castHolyShield() {
        global holyShield, buffDelay
        Send %holyShield%
        Click right
        Sleep, %buffDelay%
    }

    hammers(timeToCast) {
        global concentration, redemption
        MouseMove, 50 , 50
        Sleep, 10
        MouseMove, 5 , 5
        send %concentration%
        send {Shift Down}
        Click down left
        Sleep, timeToCast
        Click up left
        send {Shift Up}
        send %redemption%
        Sleep, 500
    }

    selfPot_1() {
        send 1
    }

    selfPot_2() {
        send 2
    }

    selfPot_3() {
        send 3
    }

    selfPot_4() {
        send 4
    }