extends Node2D



func _on_StarSpawnTimer_timeout():
	var star : Node2D = load("res://src/Star.tscn").instance()
	star.position = _random_position()
	while star.position.distance_to($Player.position) < 100:
		star.position = _random_position()
	add_child(star)


func _random_position()->Vector2:
	var x := rand_range(50,1024-50)
	var y := rand_range(50,550)
	return Vector2(x,y)
