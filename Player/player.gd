extends CharacterBody2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction : Vector2 = Vector2.ZERO
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine

func _ready():
	
	animation_tree.active = true

func update_animation():
	animation_tree.set("parameters/Move/blend_position", direction.x)

func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true

func update_hurt_player(attack_damage):
	if(state_machine.current_state.is_hurt == false):
		Game.playerHP -= attack_damage	
	state_machine.update_hurt_player()


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() && !state_machine.current_state.is_flying:
		velocity.y += gravity * delta
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("Left", "Right", "Up", "Down")
	
	if direction.x != 0 && state_machine.check_if_can_move():
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	update_animation()
	update_facing_direction()
	check_if_alive()
	
func check_if_alive():
	if Game.playerHP <= 0:
		queue_free()
		get_tree().change_scene_to_file("res://main.tscn")
		reset_player()

func reset_player():
	Game.playerHP = 10
	Game.gold = 0;
	Utils.saveGame()
