blizzard = {F1}
iceBlastStart = {F2 down}
iceBlastEnd = {F2 up}
glacialSpikeStart = {F3 down}
glacialSpikeEnd = {F3 up}

F::
    blizzCombo(iceBlastStart, iceBlastEnd)
return

F2::
    blizzCombo(glacialSpikeStart, glacialSpikeEnd)
return

blizzCombo(abilityDown, abilityUp) {
    global blizzard
    Send {F1}
    Sleep, 10
    Send {F2 down}
    Sleep, 1850
    Send {F2 up}
}