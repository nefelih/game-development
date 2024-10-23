extends Node2D

@export var enemy_chicken_scene: PackedScene
@export var chase_speed : float = 2000.0
var target : CharacterBody2D
var count: int = 0

var count_down: bool = false

@export var bg_music : Resource


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$StartTimer.start()
	GlobalAudioManager.play_track(bg_music, 0.5)
	HealthManager.full_health()
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	print(get_tree().get_nodes_in_group("enemy").size())
	if ((get_tree().get_nodes_in_group("enemy").size() == 0) && (count_down == true)):
		print("hooray you win !")
		get_tree().change_scene_to_file("res://levels/win.tscn")

#make sure enemies spawn in time
func _on_rest_timeout() -> void:
	count_down = true


func _on_mob_timer_timeout() -> void:
	
	if (not $MobTimer.is_stopped()):
		
		var player = get_node("Player")
		
		var chicken = enemy_chicken_scene.instantiate()
		var chicken_spawn_location = $Spawn/Sprite2D.global_position
		#print($Spawn/Sprite2D.position)
		add_child(chicken)
		chicken.global_position = chicken_spawn_location

		var chicken_2 = enemy_chicken_scene.instantiate()
		var chicken_spawn_location_2 = $Spawn2/Sprite2D.global_position
		#print($Spawn/Sprite2D.position)
		add_child(chicken_2)
		chicken_2.global_position = chicken_spawn_location_2
		
		count += 1
		
	#chicken.spawn(chicken_spawn_location, player, 600.0)
	

func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	#print(count)
	
	if (count == 20):
		$MobTimer.stop()
		$StartTimer.stop()
	#print("THE MOB TIMER HAS STARTED")
