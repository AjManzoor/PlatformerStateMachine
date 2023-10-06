extends Label

func _ready():
	pass
	
func _process(delta):
	text = "HP: " + str(Game.playerHP)
