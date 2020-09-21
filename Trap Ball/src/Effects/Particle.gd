extends Node2D

export var life_time = 1.0
export var max_speed_x = 100.0
export var max_speed_y = 400.0
export var gravity = 1000.0

var speed_x
var speed_y

onready var life_time_timer = $LifeTime


# Called when the node enters the scene tree for the first time.
func _ready():
	speed_x = rand_range(-max_speed_x, max_speed_x)
	speed_y = rand_range(-max_speed_y/2, -max_speed_y)
	life_time_timer.start(life_time)

func _process(delta):
	speed_y += gravity * delta
	position.x += speed_x * delta
	position.y += speed_y * delta

func _on_LifeTime_timeout():
	queue_free()

#looks for world
func _on_Particle_body_entered(body):
	if speed_y > 0:
		#bounce on the floor
		speed_y = -speed_y/2
