extends Node2D

var Cherry = preload("res://Collectables/Cherry.tscn")


func _on_timer_timeout():
	var cherryTemp = Cherry.instantiate()
	var rng = RandomNumberGenerator.new()
	var rant = rng.randi_range(200, 1000)
	cherryTemp.position = Vector2(rant,400)
	#to add the child to a node (for whatever reason)
	#get_node("Cherries").add_child(cherryTemp)
	add_child(cherryTemp)
