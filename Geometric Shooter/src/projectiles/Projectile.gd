extends Area2D

class_name Projectile


export var speed = 500
export var damage = 1
export var life_time = 10.0

var direction = Vector2()

onready var sprite = $Sprite
onready var timer = $Timer


func init(initial_pos, destination_pos):
	position = initial_pos
	direction = (destination_pos - initial_pos).normalized()
	$Timer.start(life_time)

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
