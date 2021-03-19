class_name Player
extends Character

export var mouse_sensitivity: float = 0.3

var camera_x_rotation = 0

onready var camera = $Head/Camera
onready var weapon = $Head/WeaponRayCast


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	mouse_look(event)

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	jump(Input.is_action_just_pressed("jump"))
	crouch(Input.is_action_pressed("crouch"))
	sprint(Input.is_action_pressed("sprint"))
		
	if weapon:
		if Input.is_action_pressed("primary_fire"):
			weapon.primary_attack()
		if Input.is_action_just_pressed("reload"):
			weapon.reload()

func _physics_process(delta: float):
	move(get_direction_input(), delta)


func mouse_look(event):
	if not event is InputEventMouseMotion: return
	
	#Rotate HEAD Horizontally
	head.rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))
	
	#Rotate the CAMERA Vertically
	var x_delta = event.relative.y * mouse_sensitivity #x increment
	if camera_x_rotation + x_delta > -90 and camera_x_rotation + x_delta < 90:
		camera.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity))
		camera_x_rotation += x_delta


func get_direction_input():
	var direction = Vector3()
	#The basis contain the local transform
	var head_basis = head.get_global_transform().basis
	
	if Input.is_action_pressed("move_forward"):
		direction -= head_basis.z
	elif Input.is_action_pressed("move_backward"):
		direction += head_basis.z
	if Input.is_action_pressed("move_left"):
		direction -= head_basis.x
	elif Input.is_action_pressed("move_right"):
		direction += head_basis.x
	
	return direction.normalized()
