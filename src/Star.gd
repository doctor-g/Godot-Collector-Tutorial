extends Area2D

func _on_Star_body_shape_entered(_body_id, _body, _body_shape, _area_shape):
	GameState.score += 10
	queue_free()
