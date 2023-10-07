extends State

class_name AirState

var has_double_jumped : bool = false

@export var landing_state : State
@export var fly_state : State
@export var double_jump_velocity : float = -500
@export var double_jump_name : String = "Jump2"
@export var landing_state_animation : String = "Fall"
@export var hurt_state : State

func state_process(delta):
	if(character.velocity.y > 0 && !character.is_on_floor()):
		next_state = landing_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("Jump") && !has_double_jumped):
		double_jump()
	elif event.is_action_pressed("Jump") && has_double_jumped:
		next_state = fly_state

func on_enter():
	playback.travel("Jump")
	

func double_jump():
	character.velocity.y = double_jump_velocity
	has_double_jumped = true;
	playback.travel(double_jump_name)

func on_exit():
	if(next_state == landing_state):
		playback.travel(landing_state_animation)
		has_double_jumped = false
