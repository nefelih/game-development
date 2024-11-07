extends Node2D

@export var bg_music : Resource

func _ready():
		GlobalAudioManager.play_track(bg_music, 1)

	

func _input(event: InputEvent) -> void:
	if (Input.is_action_just_pressed("swat")):
		get_tree().change_scene_to_file("res://gameplay_loop/start.tscn")
