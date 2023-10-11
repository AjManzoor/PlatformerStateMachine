extends State

class_name PunchState

@export var ground_state : State
@export var attack_timer : Timer

func state_process(delta):
	pass

func on_enter():
	animation()
	attack_timer.start()

func animation():
	pass

func ground():
	print("STATE : ground") 
	next_state = ground_state
	can_move = false

func _on_timer_timeout():
	ground()
