extends KinematicBody2D

class_name Actor

export var DestroyEffect = preload("res://src/effects/HitEffect.tscn")

onready var health_component = $HealthComponent
onready var movement_component = $MovementComponent

func take_damage(damage_amount):
	health_component.take_damage(damage_amount)

func set_direction(_direction):
	movement_component.set_direction(_direction)

func destroy():
	var destroy_effect = DestroyEffect.instance()
	destroy_effect.position = position
	get_tree().current_scene.add_effect(destroy_effect)
	queue_free()
