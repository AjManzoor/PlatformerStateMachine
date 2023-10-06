extends State

class_name CrouchState

@export var ground_state : State

		
func state_process(delta):
	CheckIfPlayerIsStillCrouching()

func CheckIfPlayerIsStillCrouching():
	if(!Input.is_action_pressed("Down")):
		stand()
	
func stand():
	next_state = ground_state
	playback.travel("Move")
		
