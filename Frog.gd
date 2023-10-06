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


func _on_player_death_body_entered(body):
	if body.name == "Player":
		death()
		

func _on_player_collision_body_entered(body):
	if body.name == "Player":
		body.update_hurt_player()
		death()

func death():
	Game.gold +=5
	Utils.saveGame()
	self.queue_free()
	
