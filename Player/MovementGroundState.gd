extends MovementState

func state_process(delta):
	move()
	update_facing_direction()
	check_if_player_jumped()
	check_if_player_moving()
		

func check_if_player_jumped():
	if(Input.is_action_pressed("Up")):
		jump()

func stop_moving():
	next_state = ground_state
