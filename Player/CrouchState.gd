extends State

class_name CrouchState

@export var ground_state : State

		
func state_process(delta):
	check_if_player_is_still_crouching()

func check_if_player_is_still_crouching():
	if(!Input.is_action_pressed("Down")):
		stand()

func on_enter():
	can_move = false	
	
func stand():
	next_state = ground_state
	can_move = true
	playback.travel("Move")
		
