extends Node2D

@export var bg_music : Resource
@export var is_running: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalAudioManager.play_track(bg_music, 0.5)
	get_tree().change_scene_to_file("res://levels/start_page.tscn")
	
