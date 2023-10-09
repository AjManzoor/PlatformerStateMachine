extends MovementAirState


func state_process(delta):
	move()
	update_facing_direction()
	check_if_player_moving()
	

func on_enter():
	SPEED = 600
	playback.travel("Dash") 
	

func stop_moving():
	next_state = flying_state

