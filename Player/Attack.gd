extends State

class_name AttackState

@export var ground_state : State
@export var attack_timer : Timer
@export var next_attack_state : AttackState
@export var attack_hitbox : CollisionShape2D


func state_process(delta):
	pass

func on_enter():
	can_move = false
	animation()
	attack_timer.start()

func animation():
	pass
	
func on_exit():
	attack_hitbox.set_disabled(true)

func _on_attack_timer_timeout():
	ground()

func ground():
	next_state = ground_state
	
func goto_next_attack_state():
	attack_timer.stop()
	next_state = next_attack_state
	#pass

func state_input(event : InputEvent):
	if(event.is_action_pressed("Attack")):
		goto_next_attack_state()
	
