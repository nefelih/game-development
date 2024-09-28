extends CharacterBody2D

@export var projectile_scene: Resource
@export var bomb_scene: Resource
@export var move_speed: float = 100.0

#@onready var noir_idle = $SpriteIdle
#@onready var noir_walking = $SpriteWalking

@onready var noir_pos = $Noir.global_position

@onready var noir_idle = get_node("Noir/SpriteIdle")
@onready var noir_walking = get_node("Noir/SpriteWalking")
@onready var colt = get_node("Noir/Colt")


func _input(event):
	if (event is InputEventMouseButton):
		# Only shoot on left click pressed down
		if (event.button_index == 1 and event.is_pressed()):
			var new_projectile = projectile_scene.instantiate()
			get_parent().add_child(new_projectile)
			
			var projectile_forward = position.direction_to(get_global_mouse_position())
			new_projectile.fire(projectile_forward, 300.0)
			new_projectile.position = $Colt/ProjectileRefPoint.global_position
			
	if (Input.is_action_just_pressed("bomb")):
		if (event.is_pressed()):
			var mouse_pos = get_viewport().get_mouse_position()
			var new_bomb = bomb_scene.instantiate()
			get_parent().add_child(new_bomb)
			
			var projectile_forward = position.direction_to(get_global_mouse_position())
			new_bomb.fire(projectile_forward, 500.0)
			new_bomb.position = $Colt/BombRefPoint.global_position
			
			#new_bomb.top_level = true
			#new_bomb.position.x = mouse_pos.x
			#new_bomb.position.y = 0
			

func _physics_process(_delta):
	noir_walking.visible = false
	
	$Colt/Sprite2D.play("idle")
	$Colt.rotation = position.direction_to(get_global_mouse_position()).angle()
	$Colt/Sprite2D.flip_v = ($Colt.rotation < -PI/2 or $Colt.rotation > PI/2)
	
	#AT THIS POINT I DIDN'T KNOW HOW TO DO ANIMATIONS WITHIN A SINGLE ANIMATED SPRITE
	#SORRY, I KNOW THIS IS A HORRIBLE WAY TO DO IT I JUST DIDN'T WANT TO REDO IT
	
	if (Input.is_action_pressed("move_right")):
		noir_idle.visible = false
		#noir_idle.stop()
		noir_walking.visible = true
		noir_walking.flip_h = true
		noir_walking.play("walking")


		
	if (Input.is_action_pressed("move_left")):
		noir_idle.visible = false
		#noir_idle.stop()
		noir_walking.visible = true
		noir_walking.flip_h = false
		noir_walking.play("walking")
		
	if (Input.is_action_pressed("move_up") || Input.is_action_pressed("move_down")):
		noir_idle.visible = false
		#noir_idle.stop()
		noir_walking.visible = true
		noir_walking.flip_h = false
		noir_walking.play("walking")

				
		
	if (Input.is_action_just_released("move_left") || Input.is_action_just_released("move_right") || Input.is_action_just_released("move_up") || Input.is_action_just_released("move_down")):
		#var mouse_pos = get_viewport().get_mouse_position()
		#if (mouse_pos.x > noir_pos.x):
		if (Input.is_action_just_released("move_right")):
			noir_idle.visible = true
			noir_idle.flip_h = true
			noir_idle.play("idle")
						
		else:
			noir_idle.visible = true
			noir_idle.flip_h = false
			noir_idle.play("idle")

	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * move_speed
	move_and_slide()
