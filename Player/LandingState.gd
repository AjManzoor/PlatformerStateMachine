extends State

class_name LandingState

@export var ground_state : State
@export var landing_animation_name : String = "Fall"
@export var hurt_state : State

				
func state_process(delta):
	if(character.is_on_floor()):
		land()

func land():
	can_move = true
	next_state = ground_state
	playback.travel("Move")
	
