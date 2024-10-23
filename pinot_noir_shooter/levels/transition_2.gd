extends Node2D


@export var bg_music : Resource

func _ready():
	GlobalAudioManager.play_track(bg_music, 0.5)


func _on_wait_timeout() -> void:
	get_tree().change_scene_to_file("res://levels/level_2.tscn")
