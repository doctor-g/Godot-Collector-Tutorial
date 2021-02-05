extends Control

func _process(_delta):
	$ScoreLabel.text = "Score: " + str(GameState.score)
	$TimeLabel.text = "Time Left: " + str(GameState.timer.time_left as int)
