extends Node2D

class_name CharacterStateMachine 
@export var character : CharacterBody2D
@export var current_state : State 
@export var animation_tree : AnimationTree
@export var hurt_state : State

var states : Array[State]

func _ready():
	for child in get_children():
		if(child is State):
			states.append(child)
			child.character = character
			child.playback = animation_tree["parameters/playback"]
			#set states with what they need to function
		else:
			push_warning("Child " + child.name + " is not a state for statemachine")

func update_hurt_player():
	switch_states(hurt_state)



func _process(delta):
	current_state.state_process(delta)

	if(current_state.next_state != null):
		switch_states(current_state.next_state)

	
func check_if_can_move():
	return current_state.can_move

func switch_states(new_state : State):
	if(current_state != null):
		if(current_state != new_state):
			current_state.on_exit()
			current_state.next_state = null
		current_state = new_state
		current_state.on_enter()

func _input(event : InputEvent):
	current_state.state_input(event)
