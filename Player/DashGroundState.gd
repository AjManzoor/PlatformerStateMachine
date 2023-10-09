extends MovementGroundState

func on_enter():
	SPEED = 600
	playback.travel("Dash") 

