extends CharacterStateMachine

class_name Enemy

@export var hp: int = 1

func hit(damage_number: int, bird_vec: Vector2):
	hp -= damage_number
	if (hp <= 0):
		#velocity = bird_vec
		#move_and_slide()
		#print(velocity.normalized())
		#print("ollo")
		
#		play falling animation
#func _on_main_sprite_animation_finished() -> void:
	#body.queue_free()
		queue_free()
