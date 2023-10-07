extends State

@export var anim : AnimationPlayer
@export var timer : Timer
var timerCount : float = 0.0;

func state_process(delta):
	if playback.is_playing():
		pass
	else:
		print("Test 2")

func on_enter():
	timer.start()
	playback.travel("Death")

func _process(delta):
	pass


func _on_timer_timeout():
	character.queue_free()
