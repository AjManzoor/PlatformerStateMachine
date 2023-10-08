extends State

class_name MovementState

@export var ground_state : State
@export var air_state : State
@export var jump_velocity : float = -350;

func state_process(delta):
	check_if_player_moving()
	check_if_player_jumped()
	
func on_enter():
	playback.travel("Run")

func check_if_player_jumped():
	if(Input.is_action_pressed("Up")):
		jump()

func check_if_player_moving():
	if(!Input.is_action_pressed("Left") && !Input.is_action_pressed("Right") ):
		stop_running()

func stop_running():
	next_state = ground_state
	
func jump():
	character.velocity.y = jump_velocity
	playback.travel("Jump")
	next_state = air_state
