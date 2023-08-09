extends Control


# This function is called when the PlayButton is pressed.
# It will load the Level scene and change to it.
func _on_PlayButton_pressed():
	get_tree().change_scene_to_file("res://level/level.tscn")
