#NoEnv ; improves performance
SendMode Input ; improves reliability

F12::
	digCooldownTime := 16000 ; exact cooldown time of dig skill 
	digAnimationTime := 3000 ; action of digging time
	turn := true ; do you want random small turns or straight lines?
	macroSlot = {1} ; what numkey is the macro on
	turnAroundEventually := true ; do a 180 and turn back at some point
	digsTilTurnAround := 20 ; how many times to dig until you turn around
	getDigging(digCooldownTime, digAnimationTime, turn, macroSlot, turnAroundEventually, digsTilTurnAround)
return

Del::
	Send {W up}
	send {S}
	Reload
return

getDigging(totalWaitTime, timeItTakesToDig, turn, macroSlot,turnAroundEventually, digsTilTurnAround) {
	timesDug := 0
	turnDirection := false
	if (totalWaitTime < 3000) {
		totalWaitTime := 3000
	} else {
		totalWaitTime += 1500
	}
	Loop {
		timesDug += 1
		turnDirection := !turnDirection
		timeToTurnAround := mod(timesDug, digsTilTurnAround) == 0

		if (turn) {
			walkTime := randomTime(2200, 2700)
		} else {
			walkTime := randomTime(1500, 2400)
		}

		pauseToWalkTime := randomTime(timeItTakesToDig, timeItTakesToDig + 500)
		remainingWaitTime := Floor(totalWaitTime - walkTime - pauseToWalkTime)
		stopTime := randomTime(remainingWaitTime - 1000, remainingWaitTime + 1000)

		if (stopTime < 0) 
			stopTime := randomTime(100, 500)

		if (timeToTurnAround && turnAroundEventually) {
			turnAround()
			Sleep 100
		}

		dig(macroSlot)
		Sleep %pauseToWalkTime%
		walk(walkTime, turn, turnDirection)	
		Sleep %stopTime%
	}
}

dig(macroSlot) {
	Send {Ctrl}
	Send %macroSlot%
return
}

walk(walkTime, turn, turnDirection) {
	turnTime := Floor(randomTime(walkTime * .02, walkTime * .1))
	Send {W down}
	if (turn) {
		turn(turnDirection, turnTime)
	}
	Sleep %walkTime%
	Send {W up}
return
}

turn(turnDirection, turnTime) {
	Sleep %turnTime%
	if (turnDirection) {
		Send {Q down}
	} else {
		send {E down}
	}
	Sleep %turnTime%
	Send {Q up}
	Send {E up}
return 
}

turnAround() {
	Send {E down}
	Sleep 1912
	Send {E up}
return
}

randomTime(num1, num2){
	Random, rand, %num1%, %num2%
return rand
}