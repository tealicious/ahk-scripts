; town portal
~E::
    Send %townPortal%
return

; Suspend script (for typing in chat)
Enter::
    Suspend, Toggle
    Send {Enter}
return

; Re-enables script in case user escapes out of text window
Escape::
    Suspend, Off
    Send {Escape}
return

Del::
    Suspend, Toggle
return

XButton2::
    Send {P} 
return