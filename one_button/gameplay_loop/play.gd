extends Node2D

#music things
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Background.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
