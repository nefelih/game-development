extends CanvasLayer


func _ready() -> void:
	HealthManager.health_updated.connect(_update_health)
	$HealthBar.value = 5

func _update_health(new_health: int):
	$HealthBar.value = new_health
	print("hello")
	
