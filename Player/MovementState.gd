extends State

class_name MovementState

@export var ground_state : State
@export var air_state : State
@export var jump_velocity : float = -350;
@export var sprite : AnimatedSprite2D
const SPEED = 300.0
var direction : Vector2

func state_process(delta):
	move()
	update_facing_direction()
	
func on_enter():
	playback.travel("Run")



func check_if_player_moving():
	if(!Input.is_action_pressed("Left") && !Input.is_action_pressed("Right") ):
		stop_moving()

func stop_moving():
	pass
	
func move():
	direction = Input.get_vector("Left", "Right", "Up", "Down")
	if direction.x != 0 && can_move:
		character.velocity.x = direction.x * SPEED
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, SPEED)
	
func jump():
	character.velocity.y = jump_velocity
	playback.travel("Jump")
	next_state = air_state
	
func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true
