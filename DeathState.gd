extends State

@export var anim : AnimationPlayer
@export var timer : Timer
var timerCount : float = 0.0;

func state_process(delta):
	if playback.is_playing():
		pass
	else:
		pass

func on_enter():
	character.velocity.x +=500
	timer.start()
	playback.travel("Death")

func _process(delta):
	pass


func _on_timer_timeout():
	character.queue_free()
