extends State

class_name ChargeState

@export var ground_state : State

func state_process(delta):
	charge();
	check_if_player_charging()

func charge():
	character.energy +=1;
	
func check_if_player_charging():
	if(!Input.is_action_pressed("Charge")):
		stop_charging()
	
func stop_charging():
	next_state = ground_state
	
func on_enter():
	playback.travel("Charge")
