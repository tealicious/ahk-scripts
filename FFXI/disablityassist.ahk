#NoEnv ; improves performance
SendMode Input ; improves reliability

randomTime(num1, num2){
	Random, rand, %num1%, %num2%
	return rand
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

dig(macroSlot) {
	Send {Ctrl}
	Send %macroSlot%
	return
}

Del::
	Send {W up}
	send {S}
	Reload
return

getDigging(totalWaitTime, timeItTakesToDig, turn, macroSlot) {
	turnDirection := false
	Loop {

		turnDirection := !turnDirection
		walkTime := randomTime(1500, 2700)
		pauseToWalkTime := randomTime(timeItTakesToDig, timeItTakesToDig + 500)

		remainingWaitTime := Floor(totalWaitTime - walkTime - pauseToWalkTime)

		stopTime := randomTime(remainingWaitTime - 1000, remainingWaitTime + 1000)
		if (stopTime < 0) 
			stopTime := 100

		dig(macroSlot)
		Sleep %pauseToWalkTime%
		walk(walkTime, turn, turnDirection)	
		Sleep %stopTime%

	}
}

F12::
	digCooldownTime := 12500 ; make this at least a full second longer than cooldown time
	digAnimationTime := 3000 ; action of digging time
	turn := true ; do you want random turns or straight lines
	macroSlot = {1} ; what numkey is the macro on
	getDigging(digCooldownTime, digAnimationTime, turn, macroSlot)
return
