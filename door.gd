extends Node2D


func _on_area_2d_body_entered(body):
	get_tree().change_scene_to_file("res://world_2.tscn")# Replace with function body.
