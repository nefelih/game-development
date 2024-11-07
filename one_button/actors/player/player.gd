extends CharacterBody2D

var swat_range: Area2D
var swat_pressed : bool = false
var target : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	swat_range = get_node("SwatRange")
	$Cat.play("idle")
	
func _physics_process(delta: float) -> void:
	var swat_targets = swat_range.get_overlapping_bodies()
	if (not swat_targets.is_empty() && (Input.is_action_just_pressed("swat"))):
		#print(potential_targets)
		target = (swat_targets[0] as Enemy)
		var spawner = get_tree().get_nodes_in_group("spawner")
		#print(spawner[0])
		#var rand_num = randi_range(0, 4)
		var nums = [1,4]
		var number = nums[randi() % nums.size()]
		
		var hitvelocity = (spawner[number].position - position).normalized() * 8000 * delta
		target.hit(1, hitvelocity)
		
