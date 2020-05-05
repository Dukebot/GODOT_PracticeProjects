extends KinematicBody2D

const UP = Vector2(0, -1)
const SPEED = 500
const GRAVITY = 300
const JUMP_SPEED = 3000

var motion = Vector2(0, 0)


func _ready():
	pass


func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	move_and_slide(motion, UP)


#I think this should be multipliyed by delta, as we are adding an acceleration amount each frame
#If the framerate drops down we will be accelerating slower I think
func apply_gravity():
	if not is_on_floor():
		motion.y += GRAVITY
	else:
		motion.y = 0


func jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED


func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0
