extends KinematicBody

export var speed = 10
export var acceleration = 5
export var gravity = 0.98
export var jump_power = 30
export var mouse_sensitivity = 0.3

onready var head = $Head
onready var camera = $Head/Camera

var velocity = Vector3()
var camera_x_rotation = 0


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	mouse_look(event)

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _physics_process(delta):
	move(delta)



func get_direction_input():
	var direction = Vector3()
	#The basis contain the local transform
	var head_basis = head.get_global_transform().basis
	
	if Input.is_action_pressed("move_forward"):
		direction -= head_basis.z
	elif Input.is_action_pressed("move_back"):
		direction += head_basis.z
	if Input.is_action_pressed("move_left"):
		direction -= head_basis.x
	elif Input.is_action_pressed("move_right"):
		direction += head_basis.x
	
	return direction.normalized()


func mouse_look(event):
	if not event is InputEventMouseMotion: return
	
	#Rotate HEAD Horizontally
	head.rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))
	
	#Rotate the CAMERA Vertically
	var x_delta = event.relative.y * mouse_sensitivity #x increment
	if camera_x_rotation + x_delta > -90 and camera_x_rotation + x_delta < 90:
		camera.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity))
		camera_x_rotation += x_delta


func move(delta):
	var direction = get_direction_input()

	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	velocity.y -= gravity
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += jump_power
	velocity = move_and_slide(velocity, Vector3.UP)
