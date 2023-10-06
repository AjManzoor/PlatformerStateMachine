extends State

class_name  FrogGroundState

@export var chase_state : State
const SPEED = 50.0

func state_process(delta):
	pass
		

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		print("enter")
		chase()


func chase():
	print("chase ")
	next_state = chase_state
	
