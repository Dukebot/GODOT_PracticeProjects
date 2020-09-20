extends KinematicBody2D

signal player_died

func _ready():
	self.connect("player_died", get_parent(), "respawn_player")

func _physics_process(delta):
	var direction = $PlayerInput.get_horizontal_direction()
	$PlayerMovement.move(direction, delta)
	if position.y > 2000:
		destroy()

func _on_Hitbox_area_entered(area):
	destroy()

func destroy():
	emit_signal("player_died")
	queue_free()

func set_jump_speed(value):
	$PlayerMovement.JUMP_SPEED = value

func get_jump_speed():
	return $PlayerMovement.JUMP_SPEED
