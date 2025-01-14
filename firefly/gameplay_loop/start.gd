extends Node2D

@export var bg_music : Resource

func _ready():
	$Background.play("idle")
	GlobalAudioManager.play_track(bg_music, 1)
	#$Title2.play("default")
	#$Text.play("default")


func _input(event: InputEvent) -> void:
	if (Input.is_action_just_pressed("swat")):
		get_tree().change_scene_to_file("res://gameplay_loop/play.tscn")
