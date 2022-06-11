#Include utils/init.ahk
#Include _vars.ahk

; =============================================================
; NOTICE: TOGGLE OFF QUICK CAST SKILLS IN D2R GAMEPLAY SETTINGS
; =============================================================
global callToArmsEquipped := true
global holyShieldOnSwapHand := false

; =============================================
; Character Configuration
; =============================================
global armorRunBonus := 20
global vigorRunBonus := 46
global skullders := true

; =============================================
; Load Screen Times in Milliseconds (1000 = 1s)
; =============================================
global gameLoadTime := 6000
characterLoadScreenTime := 3000
buffDelay := 720 ; in milliseconds
weaponSwapDelay := 500 ; in milliseconds
global wayPointLoadTime := 1500 

#Include _aura-cycle.ahk
#Include utils/base.ahk
#Include utils/hd-auto-auras.ahk
#Include utils/hd-cast-buffs.ahk
#Include utils/hd-click-charge.ahk

; =============================================
; Code you don't need to fuck with
; =============================================
if (skullders == true) {
    armorRunBonus -= 5
} else {
    armorRunBonus += 5
}

CoordMode, Mouse, Screen

Ins::
    reInitRun()
return

XButton2::
    Send {I}
return

~XButton1 & RButton::
    reInitRun()
return

XButton1::
    send {Shift down}
    Send %concentration%
return

XButton1 up::
    send {Shift up}
    Send %redemption%
return

~BS::
    Suspend, off
    Send {Shift Up}
    Send %forceMoveEnd%
    Reload
return

~RButton & LButton::
    Suspend, off
    Send {Shift Up}
    Send %forceMoveEnd%
    Reload
return

MButton::
    Send {Shift down}
    Click right
    Send {Shift up}
return

Shift & Enter::
    initRun()
return

initRun() {
    startGame()
    runKurast(vigorRunBonus, armorRunBonus)
    runTravincal(vigorRunBonus, armorRunBonus)
}

reInitRun() {
    restart()
    Sleep %characterLoadScreenTime%
    startGame()
    runKurast(vigorRunBonus, armorRunBonus)
    runTravincal(vigorRunBonus, armorRunBonus)
}

restart() {
    Send {Esc}
    Sleep 10
    Send {Down}
    Send {Down}
    Send {Up}
    Send {Enter}
}

startGame() {
    Send %forceMoveEnd%
    Sleep 200
    MouseMove, (A_ScreenWidth // 2) - 100, (A_ScreenHeight - 100)
    Click, Left
    Sleep 200
    MouseMove, (A_ScreenWidth // 2) , (A_ScreenHeight // 2) + 50
    Click, Left
    Sleep %gameLoadTime%
}

runKurast(vigorAdjust, armorAdjust) {
    Send %primaryAura%
    Sleep 250
    MouseMove, (A_ScreenWidth - 325) , (A_ScreenHeight // 2) + 100
    Sleep 500
    Send %forceMove%
    vigorAdjustedSleep(1400, vigorAdjust, armorAdjust)

    MouseMove, (A_ScreenWidth - 325) , 200
    Send %forceMoveStart%
    vigorAdjustedSleep(4250, vigorAdjust, armorAdjust)

    MouseMove, (A_ScreenWidth - 300) , (A_ScreenHeight // 2) 
    Send {G}
    vigorAdjustedSleep(6000, vigorAdjust, armorAdjust)

    Send %forceMoveEnd%
    Sleep 250
    MouseMove, (A_ScreenWidth //2) - 250 , (A_ScreenHeight // 2) - 25
    Sleep 250
    Click left
    Sleep 500
    MouseMove, (A_ScreenWidth //2) - 520 , (A_ScreenHeight - 375)
    Click left
    Sleep %wayPointLoadTime%
}

runTravincal(vigorAdjust, armorAdjust) {
    castPalyBuffs()
    Sleep %buffDelay%
    Send %primaryAura%
    moveToCouncilSteps(vigorAdjust, armorAdjust)

    moveAlongSteps(300, 300, 1300)
    selfPot()
    hammers(10000)

    moveAlongSteps(450, 250, 1800)
    moveAlongSteps(-240, 650, 1400)
    selfPot()
    hammers(10000)

    moveAlongSteps((A_ScreenWidth // 2 * -1), 0, 2000)
    selfPot()
    hammers(10000)

    moveAlongSteps((A_ScreenWidth // 4), (A_ScreenHeight * .75), 500)

    Send %showLoot%
    Sleep 250
    Send {G}
}

moveAlongSteps(right, top, sleepTime) {
    send %redemption%
    send {R}
    MouseMove, (A_ScreenWidth // 2) + right , top
    Sleep 50
    Send %forceMoveStart%
    Sleep sleepTime
    Send %forceMoveEnd%
    send {R}
}

moveToCouncilSteps(vigorAdjust, armorAdjust) {
    MouseMove, (A_ScreenWidth - 470) , (A_ScreenHeight - 180)
    Send %forceMoveStart%

    vigorAdjustedSleep(1200, vigorAdjust, armorAdjust)
    MouseMove, (A_ScreenWidth - 300) , 200

    vigorAdjustedSleep(1595, vigorAdjust, armorAdjust)
    MouseMove, (A_ScreenWidth - 300) ,500

    vigorAdjustedSleep(2175, vigorAdjust, armorAdjust)
    MouseMove, (A_ScreenWidth - 300) ,580

    vigorAdjustedSleep(1500, vigorAdjust, armorAdjust)
    MouseMove, (A_ScreenWidth - 270) ,900

    vigorAdjustedSleep(3500, vigorAdjust, armorAdjust)

    Send %forceMoveEnd%

    Sleep 250
}

vigorAdjustedSleep(Sleeptime, vigorAdjust, armorAdjust) {
    effectiveRuneSpeed = ((6 + 4 * ((vigorAdjust / 100) + (armorAdjust * 150 / (armorAdjust + 150) / 100))) / 6)
    ;MsgBox % Sleeptime / ((6 + 4 * ((vigorAdjust / 100) + (armorAdjust * 150 / (armorAdjust + 150) / 100))) / 6)
    Sleep Sleeptime / ((6 + 4 * ((vigorAdjust / 100) + (armorAdjust * 150 / (armorAdjust + 150) / 100))) / 6)
}

hammers(timeToCast) {
    MouseMove, 50 , 50
    Sleep 10
    MouseMove, 5 , 5
    send %concentration%
    send {Shift Down}
    Click down left
    Sleep timeToCast
    Click up left
    send {Shift Up}
    send %redemption%
    Sleep 500
}

global potCol = 0

selfPot() {
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