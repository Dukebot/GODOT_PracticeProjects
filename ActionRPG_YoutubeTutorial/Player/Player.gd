extends KinematicBody2D

var velocity = Vector2()
var speed = 4

func _ready():
	pass

func _physics_process(delta):
	var velocity = get_input_vector()
	move_and_collide(velocity)

func get_input_vector() -> Vector2:
	return Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
