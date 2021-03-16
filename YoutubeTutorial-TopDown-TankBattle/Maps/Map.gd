extends Node2D

func _ready():
	set_camera_limits()
	Input.set_custom_mouse_cursor(
		load("res://assets/UI/crossair_black.png"), 
		Input.CURSOR_ARROW, 
		Vector2(16, 16) #because the sprite it's 32x32 pixels
	)

func set_camera_limits():
	var map_limits = $Ground.get_used_rect()
	var map_cellsize = $Ground.cell_size
	
	$PlayerTank/Camera2D.limit_left   = map_limits.position.x * map_cellsize.x
	$PlayerTank/Camera2D.limit_right  = map_limits.end.x      * map_cellsize.x
	$PlayerTank/Camera2D.limit_top    = map_limits.position.y * map_cellsize.y
	$PlayerTank/Camera2D.limit_bottom = map_limits.end.y      * map_cellsize.y

func _on_Tank_shoot(Bullet, _position, _direction, _target = null):
	var bullet = Bullet.instance()
	bullet.start(_position, _direction, _target)
	add_child(bullet)

func _on_Player_dead():
	get_tree().reload_current_scene()
