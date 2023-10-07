extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO


@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine : EnemyStateMachine = $FrogStateMachine

func _ready():
	animation_tree.active = true

func update_animation():
	animation_tree.set("parameters/Idle", true)


func _physics_process(delta):
	velocity.y += gravity * delta
	update_animation()
	move_and_slide()
	update_facing_direction()


func _on_player_death_body_entered(body):
	if body.name == "Player":
		death()
		

func _on_player_collision_body_entered(body):
	if body.name == "Player":
		body.update_hurt_player(2)
		death()

func death():
	Game.gold +=5
	Utils.saveGame()
	state_machine.death()
	
func update_facing_direction():
	var player = get_node("../../Player/Player")
	direction = (player.position - self.position).normalized()
	if direction.x > 0:
		sprite.flip_h = true
	elif direction.x < 0:
		sprite.flip_h = false
