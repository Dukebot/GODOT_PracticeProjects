class_name Character
extends KinematicBody

export var speed: float = 10
export var sprint_multiplier: float = 1.5
export var crouch_multiplier: float = 0.5

export var acceleration: float = 5
export var gravity: float = 0.98
export var jump_power: float = 30

var linear_velocity: Vector3 = Vector3()
var crouch_speed: float = 1
var sprint_speed: float = 1

onready var head = $Head
onready var health_component: HealthComponent = $HealthComponent


func _process(delta):
	jump(false)

func _physics_process(delta: float):
	move(Vector3.ZERO, delta)

func _on_HealthComponent_no_health():
	queue_free()


func move(direction: Vector3, delta: float) -> void:
	var movement_vector = direction * speed * crouch_speed * sprint_speed
	linear_velocity = linear_velocity.linear_interpolate(movement_vector, acceleration * delta)
	linear_velocity.y -= gravity
	linear_velocity = move_and_slide(linear_velocity, Vector3.UP)

func jump(jumped: bool):
	if jumped and is_on_floor():
		linear_velocity.y += jump_power

func crouch(crouched: bool) -> void:
	if crouched:
		crouch_speed = crouch_multiplier
		sprint_speed = 1
	else:
		crouch_speed = 1

func sprint(sprinting: bool) -> void:
	if sprinting:
		sprint_speed = sprint_multiplier
	else:
		sprint_speed = 1

