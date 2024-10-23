extends State

var exploder : CharacterBody2D
var idle_state: State
@export var explode_sfx : Resource
var play: bool = true
func initialize():
	pass
	
func process_state(delta: float):
	#print(body)
	var explode_sprite = body.get_child(0)
	#print(body.get_child(0))
	#print(explode_sprite)
	play_sound()
	play = false
	explode_sprite.play("explode")


func play_sound():
	if (play == true):
		GlobalAudioManager.play_SFX(explode_sfx, 0.4)


func _on_main_sprite_animation_finished() -> void:
	body.queue_free()
	HealthManager.damage(1)
	print(HealthManager.current_health)
