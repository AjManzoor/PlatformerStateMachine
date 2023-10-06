extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false;
const SPEED = 50.0

@onready var anim = get_node("AnimatedSprite2D")


func _ready():
	anim.play("Idle")


func _physics_process(delta):
	velocity.y += gravity * delta
	if(chase == true):
		player = get_node("../../Player/Player")
		var direction = (player.position - self.position).normalized()
		velocity.x = direction.x * SPEED
		if(anim.animation != "Death"):
			anim.play("Jump")
		if(direction.x > 0):
			anim.flip_h = true;
		else:
			anim.flip_h = false;
	else:
		velocity.x = 0
		if(anim.animation != "Death"):
			anim.play("Idle")
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true
		


func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false


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
	chase = false
	anim.play("Death")
	await anim.animation_finished
	self.queue_free()
	
