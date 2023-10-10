extends MovementAirState

func state_process(delta):
	move()
	update_facing_direction()
	check_if_player_moving()
	reduce_energy()
	check_if_energy_depleted()

func on_enter():
	energy_cost = 3
	SPEED = 600
	playback.travel("Dash") 
	

func stop_moving():
	next_state = flying_state

