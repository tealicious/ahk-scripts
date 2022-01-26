#NoEnv
SendMode Input
#IfWinActive, Diablo II: Resurrected

    armorRunBonus := 20
    vigorRunBonus := 46
    skullders := true
    ctaSwap := true

    ; =============================================
    ; Load Screen Times in Milliseconds (1000 = 1s)
    ; =============================================
    gameLoadTime := 3000
    characterLoadScreenTime := 3250
    wayPointLoadTime := 1500

    if (skullders == true) {
        armorRunBonus -= 5
    } else {
        armorRunBonus += 5
    }

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
    hammers = {F11}
    forceMove = {F12}
    defaultWeaponSwap = {Y}
    buffDelay := 500 ; in milliseconds
    weaponSwapDelay := 150 ; in milliseconds
    teleportDelay := 500 ; in milliseconds

    ;charge with right click
    ~RButton::
        Send {F11 down}
        Send {Shift Down}
    return

    ~RButton up::
        Send {F11 up}
        Send {Shift up}
    return

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

    L::
        reInitRun()
    return

    M::
        runTravincal(vigorRunBonus, armorRunBonus)
    return

    XButton1::
        reInitRun()
    return

    Enter::
        initRun()
    return

    initRun() {
        global vigorRunBonus, armorRunBonus
        startGame()
        runKurast(vigorRunBonus, armorRunBonus)
        runTravincal(vigorRunBonus, armorRunBonus)
    }

    reInitRun() {
        global vigorRunBonus, armorRunBonus, characterLoadScreenTime
        restart()
        Sleep, characterLoadScreenTime
        startGame()
        runKurast(vigorRunBonus, armorRunBonus)
        runTravincal(vigorRunBonus, armorRunBonus)
    }

    restart() {
        Send {Esc}
        Sleep, 10
        Send {Down}
        Send {Down}
        Send {Up}
        Send {Enter}
    }

    startGame() {
        global gameLoadTime
        Send {F12 up}
        Sleep, 200
        MouseMove, (A_ScreenWidth // 2) - 100, (A_ScreenHeight - 100)
        Click, Left
        Sleep, 200
        MouseMove, (A_ScreenWidth // 2) , (A_ScreenHeight // 2) + 50
        Click, Left
        Sleep, gameLoadTime
    }

    runKurast(vigorAdjust, armorAdjust) {
        global vigor, wayPointLoadTime
        Send %vigor%

        MouseMove, (A_ScreenWidth - 325) , (A_ScreenHeight // 2) + 100
        Sleep, 100
        Send {F12}
        vigorAdjustedSleep(1400, vigorAdjust, armorAdjust)

        MouseMove, (A_ScreenWidth - 325) , 200
        Send {F12 down}
        vigorAdjustedSleep(4250, vigorAdjust, armorAdjust)

        MouseMove, (A_ScreenWidth - 300) , (A_ScreenHeight // 2) 
        Send {G}
        vigorAdjustedSleep(6000, vigorAdjust, armorAdjust)

        Send {F12 up}
        Sleep, 100
        MouseMove, (A_ScreenWidth //2) - 250 , (A_ScreenHeight // 2) - 25
        Sleep, 100
        Click left
        Sleep, 500
        MouseMove, (A_ScreenWidth //2) - 520 , (A_ScreenHeight - 375)
        Click left
        Sleep, wayPointLoadTime
    }

    runTravincal(vigorAdjust, armorAdjust) {
        castHolyShield()
        moveToCouncilSteps(vigorAdjust, armorAdjust)

        ;hammers(8000)

        moveAlongSteps(300, 300, 1300)
        selfPot()
        hammers(10000)

        moveAlongSteps(450, 250, 1800)
        moveAlongSteps(-240, 650, 1400)
        hammers(10000)

        ;moveAlongSteps(-500, (A_ScreenHeight // 2) - 200, 1200)
        moveAlongSteps((A_ScreenWidth // 2 * -1), 0, 2000)
        selfPot()
        hammers(10000)

        moveAlongSteps((A_ScreenWidth // 4), (A_ScreenHeight * .75), 500)

        Send {M}
        Sleep, 100
        Send {G}
    }

    moveAlongSteps(right, top, sleepTime) {
        global redemption
        send %redemption%
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
        global holyShield, buffDelay, ctaSwap, vigor
        if (ctaSwap == true) {
            castBattleOrders()
        }
        Send %holyShield%
        Click right
        Sleep, %buffDelay%
        Send %vigor%
        Sleep, %buffDelay%
    }

    castBattleOrders() {
        global defaultWeaponSwap, weaponSwapDelay, battleCommand, battleOrders, buffDelay
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

        Send %defaultWeaponSwap%
        Sleep, %weaponSwapDelay%
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

    potCol = 0

    selfPot() {
        global potCol
        potCol += 1
        if (potCol == 1) {
            send 1
        }
        if (potCol == 2) {
            send 2
        }
        if (potCol == 3) {
            send 3
        }
        if (potCol >= 4) {
            send 4
            potCol = 0
        }
    }