extends EnemyStateMachine 

class_name FrogStateMachine 
@export var death_state : State
@export var hurt_state : State

func death():
	switch_states(death_state)

func hurt():
	switch_states(hurt_state)
