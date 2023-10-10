extends Label
@export var character : CharacterBody2D

func _ready():
	pass
	
func _process(delta):
	text = "HP: " + str(character.health)
