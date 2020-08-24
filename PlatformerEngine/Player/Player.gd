extends KinematicBody2D

const UP = Vector2(0, -1)
const ACCELERATION = 400
const FRICTION = 400
const GRAVITY = 800
const MAX_SPEED = 300
const JUMP_SPEED = 500

var motion = Vector2()


func _ready():
	pass


func _physics_process(delta):
	
	#Horizontal movement
	if Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		motion.x += ACCELERATION * delta
		if motion.x > MAX_SPEED: motion.x = MAX_SPEED
	elif Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		motion.x -= ACCELERATION * delta
		if motion.x < -MAX_SPEED: motion.x = -MAX_SPEED
	else:
		motion.x = 0
	
	#Gravity
	if not is_on_floor():
		motion.y += GRAVITY * delta
	else:
		motion.y = 0
	
	#Jump
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y = -JUMP_SPEED
	
	#Apply Movement
	motion = move_and_slide(motion, UP)
