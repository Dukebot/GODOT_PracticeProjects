extends StaticBody2D

class_name Ground

onready var periodic_movement = $PeriodicMovementComponent

func _ready():
	if periodic_movement.speed == 0 or periodic_movement.direction == Vector2.ZERO:
		set_process(false)

func _process(delta):
	periodic_movement.move(delta)
