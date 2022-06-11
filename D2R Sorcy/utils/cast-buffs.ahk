W::
    castBuffs()
return

castBuffs() {
    if (energyShield) {
        send %energyShield%
        click right
        sleep, 500
        send %frozenArmor%
        click right
    } else {
        send %frozenArmor%
        click right
    }
    sleep, 100
    sendDefaultRightClick()
}