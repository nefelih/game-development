extends Node2D

@export var bg_music : Resource

#@export var is_running: bool = false
#
#
## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HealthManager.full_health()
	GlobalAudioManager.play_track(bg_music, 0.5)


func _input(event: InputEvent) -> void:
	if (event is InputEventMouseButton):
		if (event.button_index == 1 and event.is_pressed()):
			#print("hoorah")
			get_tree().change_scene_to_file("res://levels/transition_1.tscn")
