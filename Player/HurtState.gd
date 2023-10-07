extends State

class_name HurtState
@export var idle_state : State

var recovery_time = 1.0  # Time (in seconds) the character remains in hurt state
var timer = 0.0

func state_process(delta):
	can_move = false
	playback.travel("Hurt")
	timer += delta
	if timer >= recovery_time:
		next_state = idle_state
		playback.travel("Move")
		timer = 0.0

		
func  on_exit():
	pass


func on_enter():
	is_hurt = true

