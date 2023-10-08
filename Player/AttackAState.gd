extends AttackState

class_name AttackAState

func animation():
	playback.travel("Attack")


func _on_attack_a_timer_timeout():
	ground() # Replace with function body.

func goto_next_attack_state():
	attack_timer.stop()
	next_state = next_attack_state
	
