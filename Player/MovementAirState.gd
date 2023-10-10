extends MovementState

class_name MovementAirState

@export var flying_state : State
@export var dash_air_state : State
var energy_cost = 1;

func state_process(delta):
	move()
	update_facing_direction()
	check_if_player_moving()
	dash()
	reduce_energy()
	check_if_energy_depleted()

func check_if_energy_depleted():
	if(character.energy <=0):
		next_state = ground_state

func reduce_energy():
	character.reduce_energy(energy_cost)

func on_enter():
	playback.travel("Run")

func stop_moving():
	next_state = flying_state

func dash():
	if(Input.is_action_pressed("Charge")):
		next_state= dash_air_state
