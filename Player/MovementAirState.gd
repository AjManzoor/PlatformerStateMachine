extends MovementState

class_name MovementAirState

@export var flying_state : State
@export var dash_air_state : State

func state_process(delta):
	move()
	update_facing_direction()
	check_if_player_moving()
	dash()

func on_enter():
	playback.travel("Run")

func stop_moving():
	next_state = flying_state

func dash():
	if(Input.is_action_pressed("Charge")):
		next_state= dash_air_state
