extends Node2D
var count: int = 0


@export var enemy_scene : PackedScene



func _ready() -> void:
	$StartTimer.start(randi_range(2,5))
	#print("yay we started")
	
	
func _on_start_timer_timeout() -> void:	
	$MobTimer.start(randi_range(2,5))
	#print("mob timer started")

	

func _on_mob_timer_timeout() -> void:
	
	if (not $MobTimer.is_stopped()):
		var enemy = enemy_scene.instantiate()
		#print(bird)
		var spawn_location = $Sprite2D.global_position
		
		#print(bird_spawn_location)
		#print($Sprite2D.position)
		
		add_child(enemy)
		enemy.global_position = spawn_location
		count += 1
		
		#print(count)
		#print(bird.global_position)
