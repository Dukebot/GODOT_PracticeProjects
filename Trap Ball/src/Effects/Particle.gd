extends KinematicBody2D

const UP = Vector2(0, -1)

export var life_time = 1.0
export var max_speed_x = 100.0
export var max_speed_y = 500.0
export var gravity = 1000.0

var velocity = Vector2()
var previous_velocity = Vector2()

onready var life_time_timer = $LifeTime


# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.x = rand_range(-max_speed_x, max_speed_x)
	velocity.y = rand_range(-max_speed_y/2, -max_speed_y)
	life_time_timer.start(life_time)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = -previous_velocity.y/3
		velocity.x *= 0.8
	previous_velocity = velocity
	velocity = move_and_slide(velocity, UP)

func _on_LifeTime_timeout():
	queue_free()
