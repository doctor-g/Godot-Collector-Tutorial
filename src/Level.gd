extends Node2D

var score := 0


func _process(_delta):
	$HUD/ScoreLabel.text = "Score: " + str(score)
	$HUD/TimeLabel.text = "Time Remaining: " + str(ceil($GameTimer.time_left))


func _on_StarSpawnTimer_timeout():
	var star : Area2D = load("res://src/Star.tscn").instance()
	star.connect("body_entered", self, "_on_Star_entered", [star])
	star.position = _random_position()
	while star.position.distance_to($Player.position) < 100:
		star.position = _random_position()
	add_child(star)


func _on_Star_entered(body, star):
	if body == $Player:
		score += 10
		star.queue_free()


func _random_position()->Vector2:
	var x := rand_range(50,1024-50)
	var y := rand_range(50,550)
	return Vector2(x,y)


func _on_GameTimer_timeout():
	$Player.active = false
	$StarSpawnTimer.stop()
