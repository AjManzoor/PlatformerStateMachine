extends State

class_name  GroundState

@export var jump_velocity : float = -350;
@export var air_state : State
@export var hurt_state : State
@export var crouch_state : State
@export var attack_state : State
@export var jump_animation : String = "Jump"
@export var crouch_animation : String = "Crouch"

func state_process(delta):
	if(!character.is_on_floor() && character.velocity.y < 0):
		next_state = air_state
		
func state_input(event : InputEvent):
	if(event.is_action_pressed("Jump")):
		jump()
	if(event.is_action_pressed("Attack")):
		attack()
		
	if(event.is_action_pressed("Down")):
		crouch()
		
func jump():
	character.velocity.y = jump_velocity
	playback.travel(jump_animation)
	next_state = air_state

func on_enter():
	playback.travel("Move")

	
func crouch():
	next_state = crouch_state
	playback.travel(crouch_animation)
	
func attack():
	next_state = attack_state
