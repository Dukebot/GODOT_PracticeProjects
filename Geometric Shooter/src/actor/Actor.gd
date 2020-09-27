extends KinematicBody2D

class_name Actor

signal spawn_effect

export var DestroyEffect = preload("res://src/effects/HitEffect.tscn")

onready var health_component = $HealthComponent
onready var movement_component = $MovementComponent

func _ready():
	connect("spawn_effect", get_tree().current_scene, "add_effect")

func take_damage(damage_amount):
	health_component.take_damage(damage_amount)

func set_direction(_direction):
	movement_component.set_direction(_direction)

func destroy():
	emit_signal("spawn_effect", DestroyEffect, position)
	queue_free()
