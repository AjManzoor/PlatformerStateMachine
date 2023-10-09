class_name Player

extends CharacterBody2D

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
	animation_tree.set("parameters/Idle", direction.x)

func update_hurt_player(attack_damage):
	if(state_machine.current_state.is_hurt == false):
		Game.playerHP -= attack_damage	
	state_machine.update_hurt_player()

func get_current_state():
	return state_machine.current_state

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() && !state_machine.current_state is MovementAirState:
		velocity.y += gravity * delta

	move_and_slide()
	update_animation()
#	update_facing_direction()
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
