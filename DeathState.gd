extends State

@export var anim : AnimationPlayer
@export var timer : Timer
var timerCount : float = 0.0;

func on_enter():
	print("enter")
	timer.start()
	playback.travel("Death")

func _process(delta):
	pass

func _on_death_timer_timeout():
	print("death timeout")
	character.queue_free()
