W::
    continueWalk = 0
    if (GetKeyState("LButton", "P"))
    {
        continueWalk = 1
    }
    BlockKeyboard("On")
    Send %holyShield%
    Sleep, 100
    Click down right
    Sleep, 100
    Send %redemption%
    BlockKeyboard("Off")
    If (continueWalk = 1)
    {
        Click down left
        Click up left
    }
return

; R::
;     Send %cleansing%
; return