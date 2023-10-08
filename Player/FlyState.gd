extends State

class_name FlyState

@export var ground_state : State
@export var move_state : State

func state_process(delta):
	fly()
	check_if_landed()
	check_if_moving()


func fly():
	#playback.travel("Fly")
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	character.velocity.y = direction.y * 300 - 15

func check_if_landed():
	if character.is_on_floor():
		is_flying = false
		playback.travel("Move")
		next_state = ground_state	
		

func check_if_moving():
	if(Input.is_action_pressed("Left") ||Input.is_action_pressed("Right") ):
		next_state = move_state
	
func on_enter():
	playback.travel("Fly")
	is_flying = true
	character.velocity.y = 0
