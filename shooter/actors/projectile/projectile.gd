extends Area2D


var velocity: Vector2 = Vector2(0,0)

func fire(forward: Vector2, speed: float):
	velocity = forward * speed
	look_at(position + forward)

func _physics_process(delta):
	position += velocity * delta


func _on_time_to_live_timeout() -> void:
	queue_free()
