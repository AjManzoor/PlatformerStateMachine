extends MovementState

class_name MovementAirState

@export var flying_state : State

func state_process(delta):
	move()
	update_facing_direction()
	check_if_player_moving()

func stop_moving():
	next_state = flying_state
