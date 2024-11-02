extends Node2D

func _ready():
	$Background.play("idle")


func _input(event: InputEvent) -> void:
	if (Input.is_action_just_pressed("swat")):
		get_tree().change_scene_to_file("res://gameplay_loop/play.tscn")
