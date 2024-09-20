extends CharacterBody2D

#var velocity: Vector2 = Vector2(0,0)
@onready var mouse_pos = get_viewport().get_mouse_position()
#
#func fire(forward: Vector2, speed: float):
	#velocity = forward * speed
	#

#func _ready():
#
	#var reference_point_position = get_node("path/to/reference_point").global_position
	#self.global_position = reference_point_position 
#

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	print(global_position)
	print("HELLO")
	print(mouse_pos)
	position = position.move_toward(mouse_pos, delta * 1000)
	


func _on_time_to_live_timeout():
	queue_free()



func _on_body_entered(body: Node2D) -> void:
	(body as Enemy).hit(1)
	queue_free()
	
	
