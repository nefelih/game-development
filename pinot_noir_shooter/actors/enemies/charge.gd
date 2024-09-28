extends State

var detect_range: Area2D
var target : CharacterBody2D

func initialize():
	
	detect_range = body.get_node("DetectionRange")
	
	
#func spawn(chicken_spawn_location, player, speed):
	#var player_position = player.position
	#target_position = (player_position - chicken_spawn_location).normalized()
	#velocity = (target.position - body.position).normalized() * chase_speed * delta
	#look_at(player_position)


func process_state(delta: float):
	
	var potential_targets = detect_range.get_overlapping_bodies()
	if (not potential_targets.is_empty()):
		target = (potential_targets[1] as CharacterBody2D)
		#print(potential_targets)
	
	#print(target)
	if target:
		#var pos = (body.global_position) * randf_range(5, 30)
		body.velocity = (target.global_position - body.global_position).normalized() * 500 * delta
		body.move_and_slide()
