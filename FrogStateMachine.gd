extends EnemyStateMachine 

class_name FrogStateMachine 
@export var death_state : State
@export var hurt_state : State
@export var chase_state : State
@export var ground_state : State

func death():
	switch_states(death_state)

func hurt():
	switch_states(hurt_state)


func _on_player_detection_body_entered(body):
	if body is Player:
		switch_states(chase_state)

func _on_player_detection_body_exited(body):
	if body is Player:
		switch_states(ground_state) # Replace with function body.
