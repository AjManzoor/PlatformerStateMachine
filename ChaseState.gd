extends State

@export var ground_state : State

func state_process(delta):
	pass
	
func on_exit():
	character.velocity.x = 0
	
func on_enter():
	chase() 

func chase():
	var player = get_node("./../../../../Player/Player")
	var direction = (player.position - character.position).normalized()
	character.velocity.x = direction.x * 50
	playback.travel("Jump")
