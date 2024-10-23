extends Node

signal health_updated

var current_health : int = 5

func damage(num: int):
	
	current_health -= num
	health_updated.emit(current_health)
		
	if (current_health < 0):
		print("game over")
		get_tree().change_scene_to_file("res://levels/game_over.tscn")
	
func full_health():
	current_health = 5
	health_updated.emit(current_health)
		
		
