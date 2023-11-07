extends State

@export var anim : AnimationPlayer
@export var timer : Timer
var timerCount : float = 0.0;

func on_enter():
	timer.start()

func _process(delta):
	pass

func _on_death_timer_timeout():
	character.queue_free()
