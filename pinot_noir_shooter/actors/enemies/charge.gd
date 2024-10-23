extends State

var detect_range: Area2D
var target : CharacterBody2D

var explode_range: Area2D
var exploding_state: State

func initialize():
	
	detect_range = body.get_node("DetectionRange")
	explode_range = body.get_node("ExplodingRange")
	exploding_state = get_parent().get_node("Exploding")

	
	
#func spawn(chicken_spawn_location, player, speed):
	#var player_position = player.position
	#target_position = (player_position - chicken_spawn_location).normalized()
	#velocity = (target.position - body.position).normalized() * chase_speed * delta
	#look_at(player_position)


func process_state(delta: float):
	
	var potential_targets = detect_range.get_overlapping_bodies()
	if (not potential_targets.is_empty()):
		#print(potential_targets)
		target = (potential_targets[0] as CharacterBody2D)
		
	
	#print(target)
	if target:
		#var pos = (body.global_position) * randf_range(5, 30)
		var x_rand = randf_range(-20.0, 20.0)
		var y_rand = randf_range(-20.0, 20.0)
		body.velocity = (target.global_position - body.global_position).normalized() * 1000 * delta
		body.velocity.x += x_rand
		body.velocity.y += y_rand
		body.move_and_slide()
		var explode_target = explode_range.get_overlapping_bodies()
		if (not explode_target.is_empty()):
			exploding_state.exploder = (explode_target[0] as CharacterBody2D)
			#print("i explode chicken")
			change_state.emit(exploding_state)
