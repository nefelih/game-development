extends Sprite2D

func _physics_process(delta):
	rotation = position.direction_to(get_global_mouse_position()).angle()
	flip_v = (rotation < -PI/2 or rotation > PI/2)
	await get_tree().create_timer(3).timeout

func _on_timer_timeout() -> void:
	queue_free()
