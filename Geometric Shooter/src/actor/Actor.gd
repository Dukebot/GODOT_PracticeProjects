extends KinematicBody2D

class_name Actor

onready var health_component = $HealthComponent
onready var movement_component = $MovementComponent

func take_damage(amount):
	health_component.take_damage(amount)

func destroy():
	queue_free()
