extends Area2D

export var damage := 1

onready var collision = $CollisionShape2D


func enable_collision(time := 0.0):
	collision.disabled = false
	if time > 0:
		yield(get_tree().create_timer(time), "timeout")
		disable_collision()


func disable_collision():
	collision.set_deferred("disabled", true)
