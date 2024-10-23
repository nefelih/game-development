extends State

var explode_range: Area2D
var exploding_state: State

@export var chase_speed : float = 2000.0
var target : CharacterBody2D


func initialize():
	explode_range = body.get_node("ExplodingRange")
	exploding_state = get_parent().get_node("Exploding")

func process_state(delta: float):
	#print(target)
	var chasing_mob = body.get_child(0)
	#chasing_mob.play("idle")
	body.velocity = (target.position - body.position).normalized() * chase_speed * delta
	body.move_and_slide()
	
	var explode_target = explode_range.get_overlapping_bodies()
	if (not explode_target.is_empty()):
		#print("exploding time")
		exploding_state.exploder = (explode_target[0] as CharacterBody2D)
		change_state.emit(exploding_state)
