extends Enemy

#@export var target : CharacterBody2D
#@export var speed = 3000
#var target_position
#var player_position


func _on_time_to_live_timeout() -> void:
	queue_free()
	#print("we're dead")


func hit(damage_number: int):
	hp -= damage_number
	if (hp <= 0):
		queue_free()
		
