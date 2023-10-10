extends State

@export var ground_state : State

func _on_player_detection_body_exited(body):
	if(body is Player):
		stop_chase()

func state_process(delta):
	pass
	
func stop_chase():
	character.velocity.x = 0
	playback.travel("Idle")
	next_state = ground_state

func on_enter():
	chase() 

func chase():
	var player = get_node("./../../../../Player/Player")
	var direction = (player.position - character.position).normalized()
	character.velocity.x = direction.x * 50
	playback.travel("Jump")
