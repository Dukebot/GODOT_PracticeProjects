extends Node

class_name ShootComponent

signal spawn_projectile

export var ProjectileScene = preload("res://src/projectiles/PlayerPrimaryProjectile.tscn")
export var fire_rate = 1.0

var can_shoot = true

onready var shoot_timer = $ShootTimer
onready var shoot_sound = $ShootSound2D

func _ready():
	connect("spawn_projectile", get_tree().current_scene, "add_projectile")

func shoot(target_position):
	if can_shoot:
		can_shoot = false
		shoot_timer.start(fire_rate)
		shoot_sound.play()
		emit_signal("spawn_projectile", ProjectileScene, get_parent().position, target_position)

func _on_ShootTimer_timeout():
	can_shoot = true
