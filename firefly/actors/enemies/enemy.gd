extends CharacterStateMachine

class_name Enemy
var knocked_out_state: State

@export var hp: int = 1
var fly_away: bool = false
var flying_velocity: Vector2 = Vector2(0,0)

func initialize():
	knocked_out_state = $States/KnockedOut

func hit(damage_number: int, bird_vec: Vector2):
	hp -= damage_number
	if (hp <= 0):
		#print(bird_vec)
		
		on_change_state(knocked_out_state)
		knocked_out_state.bird_velocity = bird_vec
		
		#print(knocked_out_state.bird_velocity)
		
		#velocity = bird_vec
		#move_and_slide()
		#print(velocity.normalized())
		#print("ollo")
		
#		play falling animation
#func _on_main_sprite_animation_finished() -> void:
	#body.queue_free()
		
		
		
