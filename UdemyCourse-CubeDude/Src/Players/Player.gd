extends KinematicBody

const SPEED = 10
const UP_VECTOR = Vector3(0, 1, 0)

export (int, 1, 2) var player_id = 1

var motion: Vector3

onready var animation_player = $AnimationPlayer


func _physics_process(delta):
	move()
	animate()
	face_forward()


func move():
	var x = Input.get_action_strength("move_right_%s" % player_id) \
			- Input.get_action_strength("move_left_%s" % player_id)
	var z = Input.get_action_strength("move_down_%s" % player_id) \
			- Input.get_action_strength("move_up_%s" % player_id)
	
	var direction = Vector3(x, 0, z).normalized()
	motion = direction * SPEED
	move_and_slide(motion, UP_VECTOR)


func animate():
	if motion.length() > 0:
		animation_player.play("Arms Cross Walk")
	else:
		animation_player.stop()


func face_forward():
	if not motion.x == 0 or not motion.z == 0:
		look_at(-motion, UP_VECTOR)









