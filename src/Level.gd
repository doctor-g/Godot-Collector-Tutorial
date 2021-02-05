extends Node2D

# This is the Level script. It contains the logic for running the level.
# Every line you see that starts with a number sign (#) is a "comment".
# That means it is a note written by a programmer and is ignored by the engine.


# These are the variables that are used by our level script.
# Notice that each one is declared with the word "var", for "variable".
export var minimum_distance_to_new_star := 200.0
var score := 0


# Below the variables, we have all of our functions, 
# which are defined with the word "func".


# This function is called automatically when the level starts.
func _ready():
	make_star()
	

# Update objects in the world.
#
# This function is automatically called by the engine each frame.
func _process(_delta):
	# Update the HUD labels with the current values of the variables.
	$HUD/ScoreLabel.text = "Score: " + str(score)
	$HUD/TimeLabel.text = "Time Remaining: " + str(ceil($GameTimer.time_left))


# Create a new star in the game world.
# This will make sure it is not created on top of or too close to the player.
func make_star():
	var star : Area2D = load("res://src/Star.tscn").instance()
	star.connect("body_entered", self, "_on_Star_entered", [star])
	star.position = _random_position()
	while star.position.distance_to($Player.position) < minimum_distance_to_new_star:
		star.position = _random_position()
	add_child(star)


# This function is called when a "body" overlaps the star.
# Right now, our game only has one body: the player.
func _on_Star_entered(body, star):
	if body == $Player:
		score += 10
		star.queue_free()


# This function computes a random position on the board and 
# returns it as a Vector2, which is an (x,y) coordinate pair,
# like a point on a grid.
func _random_position()->Vector2:
	var x := rand_range(50,1024-50)
	var y := rand_range(50,550)
	return Vector2(x,y)


# This is called when the game timer runs out.
#
# We use it to deactivate the player and stop spawning new stars.
func _on_GameTimer_timeout():
	$Player.active = false


# Reload this level.
#
# This has the effect of resetting the game world.
func reload():
	get_tree().change_scene("res://src/Level.tscn")
