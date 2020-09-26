extends KinematicBody2D

class_name Actor

onready var health_component = $HealthComponent
onready var movement_component = $MovementComponent

func take_damage(damage_amount):
	health_component.take_damage(damage_amount)

func set_direction(_direction):
	movement_component.set_direction(_direction)

func destroy():
	queue_free()
