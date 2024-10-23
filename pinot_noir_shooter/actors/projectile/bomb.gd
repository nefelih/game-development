extends Area2D

var velocity: Vector2 = Vector2(0,0)
@onready var cherry_bomb = $MainSprite
@export var explode_sfx : Resource

#@onready var mouse_pos = get_viewport().get_mouse_position()
#
func fire(forward: Vector2, speed: float):
	cherry_bomb.play("shaking")
	velocity = forward * speed


func explode() -> void:
	
	GlobalAudioManager.play_SFX(explode_sfx, 0.4)
	cherry_bomb.play("explode")
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += velocity * delta
	
	


func _on_time_to_live_timeout():
	velocity = Vector2.ZERO
	explode()


func _on_body_entered(body: Node2D) -> void:
	explode()
	(body as Enemy).hit(1)
	


func _on_main_sprite_animation_finished() -> void:
	queue_free()
