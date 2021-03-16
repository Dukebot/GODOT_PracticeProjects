extends KinematicBody

const SPEED = 10
const UP_VECTOR = Vector3(0, 1, 0)

export (int, 1, 2) var player_id = 1

var motion: Vector3


func _physics_process(delta):
	move()


func move():
	var x = Input.get_action_strength("move_right_%s" % player_id) \
			- Input.get_action_strength("move_left_%s" % player_id)
	var z = Input.get_action_strength("move_down_%s" % player_id) \
			- Input.get_action_strength("move_up_%s" % player_id)
	
	var direction: Vector3 = Vector3(x, 0, z).normalized()
	move_and_slide(direction * SPEED, UP_VECTOR)
	
