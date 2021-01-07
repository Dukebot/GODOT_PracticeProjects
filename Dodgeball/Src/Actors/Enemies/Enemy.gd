class_name Enemy
extends Actor

var speed := 200.0
var direction := Vector2()

func _ready():
	direction = Vector2.RIGHT.rotated(deg2rad(rand_range(0, 360)))

func _physics_process(delta):
	var collision_info = move_and_collide(direction * speed * delta)
	if collision_info:
		direction = direction.bounce(collision_info.normal)
