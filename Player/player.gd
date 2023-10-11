class_name Player

extends CharacterBody2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const JUMP_VELOCITY = -400.0
var direction : Vector2 = Vector2.ZERO
var energy : int = 1000
var health : int = 100

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@export var attack_a_hitbox : CollisionShape2D
@export var attack_aa_hitbox : CollisionShape2D

func _ready():
	animation_tree.active = true
	attack_a_hitbox.set_disabled(true)
	attack_aa_hitbox.set_disabled(true)

func reduce_energy(energy_cost):
	energy -=energy_cost

func update_animation():
	animation_tree.set("parameters/Idle", direction.x)

func take_damage(attack_damage):
	if(state_machine.current_state.is_hurt == false):
		health -= attack_damage	
	state_machine.update_hurt_player()

func get_current_state():
	return state_machine.current_state

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() && !state_machine.current_state is MovementAirState:
		velocity.y += gravity * delta

	move_and_slide()
	update_animation()
	check_if_alive()
	
func check_if_alive():
	if health <= 0:
		queue_free()
		get_tree().change_scene_to_file("res://main.tscn")
		reset_player()

func reset_player():
	health = 100
	Game.gold = 0;
	Utils.saveGame()

func _on_attack_a_area_2d_area_entered(area):
	if area is HurtBox:
		area.take_damage(10)

func _on_attack_aa_area_2d_area_entered(area):
	if area is HurtBox:
		area.take_damage(20)
