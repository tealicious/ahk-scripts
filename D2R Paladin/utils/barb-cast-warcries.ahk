~RButton & LButton::
    Suspend, off
    if (boBarb) {
        castBoBarbBuffs()
    }
return

castBoBarbBuffs() {
    boBuffDelay = 666 ; in milliseconds
    Send {F2}
    Click right
    Sleep, %boBuffDelay%
    Click right
    Sleep, %boBuffDelay%
    Click right
    Sleep, %boBuffDelay%

    Send {F3}
    Click right
    Sleep, %boBuffDelay%
    Click right
    Sleep, %boBuffDelay% 

    Send {F4}
    Click right
    Sleep, %boBuffDelay%
    Click right
    Sleep, %boBuffDelay% 
}
