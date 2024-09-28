extends Area2D

var velocity: Vector2 = Vector2(0,0)
@onready var mouse_pos = get_viewport().get_mouse_position()
#
func fire(forward: Vector2, speed: float):
	velocity = forward * speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += velocity * delta
	


func _on_time_to_live_timeout():
	queue_free()



func _on_body_entered(body: Node2D) -> void:
	(body as Enemy).hit(1)
	queue_free()
	
	
