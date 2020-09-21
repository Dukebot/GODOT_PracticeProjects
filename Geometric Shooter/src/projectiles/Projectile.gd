extends Area2D

class_name Projectile

var speed = 0
var damage = 0

var direction = Vector2()

onready var sprite = $Sprite
onready var timer = $Timer


func init(initial_pos, destination_pos, _speed, _damage, life_time):
	position = initial_pos
	direction = (destination_pos - initial_pos).normalized()
	speed = _speed
	damage = _damage
	timer.start(life_time)
	rotation = direction.angle()

func _process(delta):
	position += direction * speed * delta

func _on_Projectile_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
	destroy()

func _on_Timer_timeout():
	destroy()

func destroy():
	queue_free()
