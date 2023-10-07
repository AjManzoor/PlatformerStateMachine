extends EnemyStateMachine 

class_name FrogStateMachine 
@export var death_state : State


func death():
	switch_states(death_state)
