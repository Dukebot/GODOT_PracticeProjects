extends "res://tanks/Tank.gd"

onready var parent = get_parent()

export (float) var turret_speed
export (int) var detect_radius

var target = null


func _ready():
	$DetectRadius/CollisionShape2D.shape.radius = detect_radius

func _on_DetectRadius_body_entered(body):
	if (body.name == "PlayerTank"): 
		target = body

func _on_DetectRadius_body_exited(body):
	if (body == target): 
		target = null

func _process(delta):
	if target:
		var target_direction = (target.global_position - global_position).normalized()
		var current_direction = Vector2(1, 0).rotated($Turret.global_rotation)
		
		$Turret.global_rotation = current_direction.linear_interpolate(
			target_direction, turret_speed * delta
		).angle()

func control(delta):
	if (parent) is PathFollow2D:
		parent.set_offset(parent.get_offset() + speed * delta)
		position = Vector2() #make sure we are always on the path (parent position)
	else:
		#other tank movement code
		pass


