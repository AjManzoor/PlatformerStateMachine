extends State

class_name BlastState

@export var ground_state : State
@export var blast_timer : Timer

var Blast = preload("res://Blast/Blast.tscn")
	
	
func state_process(delta):
	check_if_player_blasting()
	

func check_if_player_blasting():
	if(!Input.is_action_pressed("Blast")):
		stop_blasting()
			
func stop_blasting():
	next_state = ground_state
	
func spawn_ki_blast():
	var blast = Blast.instantiate()
	var characterXPos = character.position.x
	var characterYPos = character.position.y
	blast.position = Vector2(characterXPos + 60,characterYPos - 5)
	add_child(blast)
	
func on_enter():
	playback.travel("Blast")
	spawn_ki_blast()
	
