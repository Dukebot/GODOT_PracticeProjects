class_name Player
extends Character

export var mouse_sensitivity: float = 0.3

var camera_x_rotation = 0

onready var camera = $Head/Camera
onready var weapon_component = $WeaponComponent


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event):
	mouse_look(event)
	weapon_switch_input(event)


func mouse_look(event: InputEventMouseMotion) -> void:
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		head.rotation_degrees.x = clamp(head.rotation_degrees.x - event.relative.y * mouse_sensitivity, -90, 90)


func weapon_switch_input(event: InputEvent) -> void:
	# Weapon Key Switch
	if event is InputEventKey and event.scancode >= KEY_1 and event.scancode < KEY_5:
		weapon_component.switch_to_weapon(event.scancode - KEY_1)
	
	# Next/Previous Weapon
	if event is InputEventMouseButton:
		if event.is_action_pressed("next_weapon"):
			weapon_component.next_weapon()
		if event.is_action_pressed("previous_weapon"):
			weapon_component.previous_weapon()


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	#Movement Input
	jump(Input.is_action_just_pressed("jump"))
	crouch(Input.is_action_pressed("crouch"))
	sprint(Input.is_action_pressed("sprint"))
	
	#Weapon Component Input
	if Input.is_action_pressed("primary_fire"):
		weapon_component.primary_attack()


func _physics_process(delta: float):
	move(get_direction_input(), delta)


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
