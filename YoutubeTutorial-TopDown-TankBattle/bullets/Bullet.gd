extends Area2D

#Normal bullet properties
export (int) var speed
export (int) var damage
export (float) var life_time
var velocity = Vector2()

#Seeking bullet properties
export (float) var steer_force = 0
var acceleration = Vector2()
var target

#Constructor function
func start(_position: Vector2, _direction: Vector2, _target = null):
	position = _position
	rotation = _direction.angle()
	velocity = _direction * speed
	target = _target
	$LifeTime.wait_time = life_time

func _on_LifeTime_timeout():
	explode()

func _on_Bullet_body_entered(body):
	if body.has_method('take_damage'):
		body.take_damage(damage)
	explode()

func explode():
	velocity = Vector2()
	$Sprite.hide()
	$Explosion.show()
	$Explosion.play("smoke")

func _on_Explosion_animation_finished():
	queue_free()

func _process(delta):
	if target:
		acceleration += seek()
		velocity += acceleration * delta
		velocity = velocity.clamped(speed)
	position += velocity * delta

func seek():
	var desired_direction = (target.position - position).normalized() * speed
	var steer = (desired_direction - velocity).normalized() * steer_force
	return steer
