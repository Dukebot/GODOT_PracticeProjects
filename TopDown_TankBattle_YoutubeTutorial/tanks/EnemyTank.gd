extends "res://tanks/Tank.gd"

onready var parent = get_parent()

export (float) var turret_speed
export (int) var detect_radius

var speed = 0
var target = null


func _ready():
	var circle = CircleShape2D.new()
	circle.radius = detect_radius
	$DetectRadius/CollisionShape2D.shape = circle

func _on_DetectRadius_body_entered(body):
	#we've configurated that the DetecRadius Only detects the player
	#if (body.name == "PlayerTank"): 
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
		
		#see dot product on godot documentation
		if target_direction.dot(current_direction) > 0.9:
			shoot()

func control(delta):
	if $LookAhead1.is_colliding() or $LookAhead2.is_colliding():
		speed = lerp(speed, 0, 0.1)
	else:
		speed = lerp(speed, max_speed, 0.05)
	
	if (parent) is PathFollow2D:
		parent.set_offset(parent.get_offset() + speed * delta)
		position = Vector2() #make sure we are always on the path (parent position)
	else:
		#other tank movement code
		
		pass


