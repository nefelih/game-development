extends State

var lighting: PointLight2D

var bird_velocity: Vector2 = Vector2(0,0)

func initialize():
	lighting = body.get_node("Light")
	print(lighting)

func process_state(delta: float):
	body.velocity = bird_velocity
	body.move_and_slide()
