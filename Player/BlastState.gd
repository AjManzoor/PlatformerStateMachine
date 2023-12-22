extends State

class_name BlastState

@export var ground_state : State
@export var blast_timer : Timer
	
	
func state_process(delta):
	check_if_player_blasting()
	

func check_if_player_blasting():
	if(!Input.is_action_pressed("Blast")):
		stop_blasting()
			
func stop_blasting():
	next_state = ground_state
	
func on_enter():
	playback.travel("Blast")
