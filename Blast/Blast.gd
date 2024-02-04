extends CharacterBody2D

@export var blastAnimation : AnimatedSprite2D
@export var blastBody : CharacterBody2D

func move():
	pass

func _ready():
	blastAnimation.play()
	move()
	
	
