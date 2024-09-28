extends Area2D

#const GRAVITY = 2000

var velocity: Vector2 = Vector2(0,0)
var projectile_shadow = preload("res://actors/projectile/projectile_shadow.tscn")

func fire(forward: Vector2, speed: float):			
	velocity = forward * speed
	look_at(position + forward)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#velocity.y += GRAVITY * delta
	position += velocity * delta
	if (velocity != Vector2.ZERO && $TimeToLive.time_left == 0):
		$TimeToLive.start()

func _on_time_to_live_timeout():
	if (velocity != Vector2.ZERO):
		var shadow = projectile_shadow.instantiate()
		shadow.position = position
		
		get_tree().current_scene.add_child(shadow)


func _on_body_entered(body: Node2D) -> void:
	(body as Enemy).hit(1)
	queue_free()
	
	
	
