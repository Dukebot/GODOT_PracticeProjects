extends Area2D

export (int) var speed
export (int) var damage
export (float) var life_time

var velocity = Vector2()


func start(_position: Vector2, _direction: Vector2):
	position = _position
	rotation = _direction.angle()
	$LifeTime.wait_time = life_time
	velocity = _direction * speed


func _on_Bullet_body_entered(body):
	if body.has_method('take_damage'):
		body.take_damage(damage)
	explode()


func _on_LifeTime_timeout():
	explode()


func _process(delta):
	position += velocity * delta


func explode():
	velocity = Vector2()
	$Sprite.hide()
	$Explosion.show()
	$Explosion.play("smoke")

#Cuando termina la animación de la explosión, eliminamos el proyectil del árbol
func _on_Explosion_animation_finished():
	queue_free()
