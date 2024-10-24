extends State

#game over sequence
const UP_SPEED = 200

func _ready() -> void:
	pass
	
	
func process_state(delta: float):
	#print(body)
	get_tree().change_scene_to_file("res://gameplay_loop/end.tscn")

#	this is when i make the animations -> do...
	#falling.play("explode")

#func _on_main_sprite_animation_finished() -> void:
	#body.queue_free()
	#signal for game over cat animation
