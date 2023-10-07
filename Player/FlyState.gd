extends State

class_name FlyState

@export var ground_state : State

func state_process(delta):
	fly()
	check_if_landed()


func fly():
	#playback.travel("Fly")
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	character.velocity.y = direction.y * 300

func check_if_landed():
	if character.is_on_floor():
		is_flying = false
		playback.travel("Move")
		next_state = ground_state	
	
func on_enter():
	playback.travel("Fly")
	is_flying = true
	character.velocity.y = 0