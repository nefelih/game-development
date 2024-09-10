extends CharacterBody2D

@export var speed: float  = 3.0
@export var max_speed: float = 15.0
@export var paddle_width: float = 100
@export var score_label: RichTextLabel
@export var start_text: RichTextLabel


var forward = Vector2(1,1).normalized()
var current_score: int = 0
var is_running: bool = false

@onready var _animated_sprite = $AnimatedSprite2D

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if (not is_running):
		if (Input.is_action_just_pressed("click_window")):
			is_running = true
			_animated_sprite.play("glitch")
		else:
			_animated_sprite.stop()
		return
		
	var collision: KinematicCollision2D = move_and_collide(forward * speed)
	if (collision):
		forward = forward.bounce(collision.get_normal())
		speed = clamp(speed + 0.8, 1, max_speed)
		
	
	
		
	
	
	
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
	
