extends State

class_name  FrogGroundState

@export var chase_state : State
const SPEED = 50.0

func state_process(delta):
	pass
		

func _on_player_detection_body_entered(body):
	if body is Player:
		chase()

func chase():
	next_state = chase_state


func on_enter():
	print("Ground")
