extends KinematicBody2D

signal animate

const UP = Vector2(0, -1)
const SPEED = 1000
const GRAVITY = 6000 #7000 es un buen valor
const JUMP_SPEED = 2500
const WORLD_LIMIT = 4000
const BOOST_MULTIPLIER = 2

var motion = Vector2(0, 0)

func _ready():
	pass

func _physics_process(delta):
	apply_gravity(delta)
	jump()
	move()
	animate()
	move_and_slide(motion, UP)

func apply_gravity(delta):
	if position.y > WORLD_LIMIT:
		get_tree().call_group("GameState", "end_game")
	
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY * delta

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y = -JUMP_SPEED
		$JumpSFX.play()

func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0

func animate():
	emit_signal("animate", motion)

func hurt():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y -= JUMP_SPEED
	$HurtSFX.play()


func boost():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y -= JUMP_SPEED * BOOST_MULTIPLIER
