extends CharacterBody2D
#this language uses tabs not brakcets

@export var speed: float  = 3.0
@export var max_speed: float = 10.0
@export var paddle_width: float = 100
@export var health_text: RichTextLabel
@export var start_text: RichTextLabel


var forward = Vector2(1,1).normalized()
var current_health: int = 4
@export var is_running: bool = false


@onready var arr_health = get_tree().get_nodes_in_group("Health")

#func _ready() -> void:
	##velocity= Vector2(1,1).normalized()

func _physics_process(delta: float) -> void:

	if (not is_running):
		if (Input.is_action_just_pressed("click_window")):
			is_running = true
			start_text.visible = false
			visible = true
		return
	
	var collision: KinematicCollision2D = move_and_collide(forward * speed)
	if (collision):
		forward = forward.bounce(collision.get_normal())
		speed = clamp(speed + 0.5, 1, max_speed)
		
		if (current_health < 0):
			is_running = false
			start_text.visible = true
			start_text.text = "GAME OVER"
			await get_tree().create_timer(3).timeout
			get_tree().reload_current_scene()
		
		if (collision.get_collider().is_in_group("Brick")):
			collision.get_collider().queue_free()
			#var health_size = (arr_health.size())
			current_health += 1
			print(current_health)
			
			if (current_health > 4):
				current_health = 4
				
			arr_health[current_health].visible = true
			get_tree().create_timer(0.5).timeout
			print(current_health)
			
		if (collision.get_collider().is_in_group("Evil")):
			#var health_size = (arr_health.size())
			print(current_health)
			arr_health[current_health].visible = false
			#arr_health[health_size - 1].queue_free()
			current_health -= 1
			get_tree().create_timer(0.5).timeout
			print (current_health)
			#current_health -= 1
			#health_text.text = "HEALTH: " + str(current_health)
			
		if (collision.get_collider().is_in_group("Paddle")):
			var paddle_x = collision.get_collider().position.x - paddle_width
			var pos_on_paddle = (position.x - paddle_x) 
			#print("hit the paddle!" + str(pos_on_paddle))
			var bounce_angle = lerp(-PI * 0.85, -PI * 0.8, pos_on_paddle)
			forward = Vector2.from_angle(bounce_angle)
		
		if (collision.get_collider().is_in_group("GameOver")):
			is_running = false
			start_text.visible = true
			start_text.text = "GAME OVER"
			await get_tree().create_timer(3).timeout
			get_tree().reload_current_scene()
		
