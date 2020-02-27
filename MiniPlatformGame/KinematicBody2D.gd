extends KinematicBody2D

# Normal vector
const FLOOR_NORMAL = Vector2(0, -1)

const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -500

# Player speed X and Y
var motion = Vector2()


# Tick/Step (Runs every frame)
func _physics_process(delta):
	motion = calculate_movement(motion)
	motion = move_and_slide(motion, FLOOR_NORMAL)


func calculate_movement(motion):
	var out = motion
	
	# Set horizontal motion
	out.x = 0
	if Input.is_action_pressed("ui_right"): out.x += SPEED
	if Input.is_action_pressed("ui_left"):  out.x -= SPEED
	
	# Set vertical motion
	out.y += GRAVITY
	if is_on_floor() and Input.is_action_pressed("ui_up"):
		out.y = JUMP_HEIGHT
	
	return out
