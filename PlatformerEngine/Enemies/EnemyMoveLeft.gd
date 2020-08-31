extends KinematicBody2D


func _ready():
	pass


func _physics_process(delta):
	var direction = -1
	var jump = false
	$MovementComponent.move(direction, jump, delta)
