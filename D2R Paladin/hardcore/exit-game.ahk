promptUser() {
    MsgBox AutoHotkey script has been suspended, press Delete or Enter to resume script.
    Suspend, on
}

Esc::
    Suspend, off
    Send {Numpad7}
    Send {Esc}
    Send {Down}
    Send {Down}
    Send {Up}
    Send {Enter}
    promptUser()
return