extends State

var detect_range: Area2D
var chasing_state: State


func initialize():
	detect_range = body.get_node("DetectionRange")
	chasing_state = get_parent().get_node("Chasing")
	
func process_state(delta: float):
	#print("idle state running")	
	var idle_mob = body.get_child(0)
	#idle_mob.play("idle")
	var potential_targets = detect_range.get_overlapping_bodies()
	if (not potential_targets.is_empty()):
		chasing_state.target = (potential_targets[0] as CharacterBody2D)
		#print(potential_targets[0])
		change_state.emit(chasing_state)
	if (potential_targets.is_empty()):
		pass
		#print("idle state running")
