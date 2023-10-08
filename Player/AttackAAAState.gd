extends AttackState


func animation():
	playback.travel("Attack_3")



func goto_next_attack_state():
	pass


func _on_attack_aaa_timer_timeout():
	ground() # Replace with function body.
