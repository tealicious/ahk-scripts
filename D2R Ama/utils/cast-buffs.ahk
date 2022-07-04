W::
    castBuffs()
return

castBuffs() {
    send %secondaryAbility%
    click right
    sleep, 100
    send %slowMissiles%
    click right
    sleep, 100
    sendDefaultAbility()
}