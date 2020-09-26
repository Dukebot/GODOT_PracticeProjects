extends Enemy

class_name EnemySquare

onready var shoot_component = $ShootComponent
onready var player_detector_component = $PlayerDetectorComponent


func _physics_process(delta):
	var player = player_detector_component.get_player()
	if player != null:
		var player_direction = (player.position - self.position).normalized()
		movement_component.set_direction(player_direction)
		movement_component.move(delta)
		
		shoot_component.shoot(player.position)
