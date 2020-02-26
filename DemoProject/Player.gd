extends Area2D

signal hit

export (int) var SPEED

var velocity = Vector2()
var screensize


func _ready():
	hide()
	screensize = get_viewport_rect().size


func _on_Player_body_entered( body ):
	$Collision.disabled = true
	hide()
	emit_signal("hit")


func start(pos):
	position = pos
	show()
	$Collision.disabled = false


func _process(delta):
	velocity = get_velocity()
	position = update_position(position, velocity, delta, screensize)
	animate(velocity)


func get_velocity():
	var out = Vector2()
	
	if Input.is_action_pressed("ui_right"): out.x += 1
	if Input.is_action_pressed("ui_left"):  out.x -= 1
	if Input.is_action_pressed("ui_down"):  out.y += 1
	if Input.is_action_pressed("ui_up"):    out.y -= 1
	
	if out.length() > 0: out = out.normalized() * SPEED
	
	return out


func update_position(current_position, velocity, delta, screensize):
	var out = current_position
	out += velocity * delta
	out.x = clamp(out.x, 0, screensize.x)
	out.y = clamp(out.y, 0, screensize.y)
	return out


func animate(velocity):
	if velocity.length() > 0:
		$AnimatedSprite.play()
		$Trail.emitting = true
	else:
		$AnimatedSprite.stop()
		$Trail.emitting = false
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0




