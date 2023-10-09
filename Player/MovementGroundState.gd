extends MovementState
class_name MovementGroundState

@export var air_state : State

func state_process(delta):
	move()
	dash()
	update_facing_direction()
	check_if_player_jumped()
	check_if_player_moving()
		

func check_if_player_jumped():
	if(Input.is_action_pressed("Up")):
		jump() 


func jump():
	character.velocity.y = jump_velocity
	playback.travel("Jump")
	next_state = air_state

func dash():
	if(Input.is_action_pressed("Charge")):
		print("gash")
		next_state= dash_state

func stop_moving():
	next_state = ground_state

func on_enter():
	playback.travel("Run") 
