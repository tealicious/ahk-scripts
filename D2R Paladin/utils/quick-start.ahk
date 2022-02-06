CoordMode, Mouse, Screen

Shift & Enter::
    startGame()
return

Shift & Esc::
    restart()
    Sleep, characterLoadScreenTime
    startGame()
return

startGame() {
    MouseMove, (A_ScreenWidth // 2) - 100, (A_ScreenHeight - 100)
    Click, Left
    Sleep, 200
    MouseMove, (A_ScreenWidth // 2) , (A_ScreenHeight // 2) + 50
    Click, Left
}

restart() {
    Send {Esc}
    Sleep, 10
    Send {Down}
    Send {Down}
    Send {Up}
    Send {Enter}
}