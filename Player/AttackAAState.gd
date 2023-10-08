extends AttackState

class_name AttackAAState


func animation():
	playback.travel("Attack_2")


func _on_attack_aa_timer_timeout():
	ground() # Replace with function body.
	
