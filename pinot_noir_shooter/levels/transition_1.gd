extends Node2D

func _on_wait_timeout() -> void:
	print("wowza")
	get_tree().change_scene_to_file("res://levels/level_1.tscn")
