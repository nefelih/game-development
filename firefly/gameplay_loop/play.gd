extends Node2D

@export var bg_music : Resource


#music things
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Background.play("idle")
	GlobalAudioManager.play_track(bg_music, 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
