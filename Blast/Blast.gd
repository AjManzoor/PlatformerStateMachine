extends CharacterBody2D

@export var blastAnimation: AnimatedSprite2D
@export var blastBody: CharacterBody2D

func move():
	var player = get_node("./../../../../../Player/Player")
	var direction = (player.position - blastBody.position).normalized()
	blastBody.velocity -= direction * 100
	pass

func _physics_process(delta):
	move_and_slide()

func _ready():
	blastAnimation.play()
	move()

