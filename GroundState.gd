extends State

class_name  FrogGroundState

@export var chase_state : State
const SPEED = 50.0

func state_process(delta):
	pass
		

func on_enter():
	print("enter ground state")
	playback.travel("Idle")
