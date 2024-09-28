extends State

var exploder : CharacterBody2D
var idle_state: State

func initialize():
	pass
	
func process_state(delta: float):
	#print(body)
	var explode_sprite = body.get_child(0)
	#print(body.get_child(1))
	explode_sprite.play("explode")



func _on_main_sprite_animation_finished() -> void:
	body.queue_free()
