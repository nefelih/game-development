extends State

var detect_range: Area2D
var target: CharacterBody2D

var fly_range : Area2D
var flying_state: State

func initialize():
	#print("initialized")
	detect_range = body.get_node("DetectionRange")
	fly_range = body.get_node("FlyingRange")
	flying_state = get_parent().get_node("Flying")
	
	

func process_state(delta: float):
	
	#print("hello we have begun chasing")
	#print(detect_range)
	
	var potential_targets = detect_range.get_overlapping_bodies()
	if (not potential_targets.is_empty()):
		#print(potential_targets)
		target = (potential_targets[0] as CharacterBody2D)
		
	
	#print(target)
	if target:
		#var pos = (body.global_position) * randf_range(5, 30)
		var x_rand = randf_range(-50.0, 50.0)
		var y_rand = randf_range(-50.0, 50.0)
		body.velocity = (target.global_position - body.global_position).normalized() * 3500 * delta
		body.velocity.x += x_rand
		body.velocity.y += y_rand
		
		body.move_and_slide()
		
	
		var flying = fly_range.get_overlapping_bodies()
		if (not flying.is_empty()):
			change_state.emit(flying_state)
