extends AudioStreamPlayer2D

var forward = Vector2(1,1).normalized()

@onready var arr_audio = get_tree().get_nodes_in_group("Audio")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var ball_pos = arr_audio[0].global_position
	var evil_ball_pos = arr_audio[1].global_position
	
	var distance = ball_pos.distance_to(evil_ball_pos)
	#print(get_volume_db())
	
	set_autoplay(true)
		
	if (distance == 0):
		set_volume_db(1)
	else:
		var decibal_level = (distance/60)
		playing = true
		set_volume_db(-decibal_level)
		
		#print(get_volume_db())
	
		
