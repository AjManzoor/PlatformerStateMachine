extends State

@export var hurt_timer : Timer
@export var ground_state : State

func on_enter():
	hurt_timer.start()
	playback.travel("Hurt")
	character.velocity.x = 0

func _on_hurt_timer_timeout():
	print("hurt timeout")
	ground()

func ground():
	next_state = ground_state
