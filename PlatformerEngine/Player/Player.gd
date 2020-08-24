extends KinematicBody2D


const UP = Vector2(0, -1)

const ACCELERATION = 1000
const FRICTION = 4000
const GRAVITY = 2000

const MAX_SPEED = 300
const JUMP_SPEED = 800

const MAX_HEALTH = 1


var motion = Vector2()
var health = MAX_HEALTH


func _ready():
	pass


func _physics_process(delta):
	horizontal_movement(delta)
	apply_gravity(delta)
	jump()
	motion = move_and_slide(motion, UP)


func horizontal_movement(delta):
	if Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		motion.x += ACCELERATION * delta
		if motion.x > MAX_SPEED: motion.x = MAX_SPEED
	
	elif Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		motion.x -= ACCELERATION * delta
		if motion.x < -MAX_SPEED: motion.x = -MAX_SPEED
	
	elif is_on_floor():
		if motion.x > 0:
			motion.x -= FRICTION * delta
			if motion.x < 0: motion.x = 0
		elif motion.x < 0:
			motion.x += FRICTION * delta
			if motion.x > 0: motion.x = 0


func apply_gravity(delta):
	if not is_on_floor():
		motion.y += GRAVITY * delta
	else:
		motion.y = 0
	#Añadir el caso cuando tocamos contra el techo...


func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y = -JUMP_SPEED


func _on_EnemyDetector_body_entered(body):
	print("Enemy Detected! " + body.name)
