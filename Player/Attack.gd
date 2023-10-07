extends State

class_name AttackState

@export var ground_state : State
@export var attack_timer : Timer

func state_process(delta):
	pass

func on_enter():
	playback.travel("Attack")
	attack_timer.start()


func _on_attack_timer_timeout():
	ground()

func ground():
	next_state = ground_state


	
