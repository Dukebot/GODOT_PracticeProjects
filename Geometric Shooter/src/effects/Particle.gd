extends Node2D

export var speed_min = 100
export var speed_max = 300

var direction
var speed

func _ready():
	direction = Vector2.RIGHT.rotated(deg2rad(rand_range(0, 360)))
	speed = rand_range(speed_min, speed_max)

func _process(delta):
	rotation = direction.angle()
	position += speed * direction * delta

func _on_LifeTime_timeout():
	queue_free()
