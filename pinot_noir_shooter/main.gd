extends Node2D

@export var enemy_chicken_scene: PackedScene
@export var chase_speed : float = 2000.0
var target : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$StartTimer.start()
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mob_timer_timeout() -> void:
	var player = get_node("Player")
	var chicken = enemy_chicken_scene.instantiate()
	var chicken_spawn_location = $Spawn/Sprite2D.global_position
	print($Spawn/Sprite2D.position)
	add_child(chicken)
	
	var chicken2 = enemy_chicken_scene.instantiate()
	var chicken_spawn_location2 = $Spawn2/Sprite2D.global_position
	print($Spawn2/Sprite2D.position)
	add_child(chicken)
	
	#chicken.spawn(chicken_spawn_location, player, 600.0)
	

func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	#print("THE MOB TIMER HAS STARTED")
