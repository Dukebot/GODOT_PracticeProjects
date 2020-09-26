extends Node

class_name ShootComponent

export var ProjectileScene = preload("res://src/projectiles/PlayerPrimaryProjectile.tscn")
export var fire_rate = 1.0

var can_shoot = true

onready var shoot_timer = $ShootTimer
onready var shoot_sound = $ShootSound2D

func shoot(target_position):
	if can_shoot:
		can_shoot = false
		shoot_timer.start(fire_rate)
		shoot_sound.play()
		create_projectile(target_position)

func create_projectile(target_position):
	var projectile = ProjectileScene.instance()
	get_tree().current_scene.add_child(projectile)
	projectile.position = get_parent().position
	projectile.set_direction((target_position - projectile.position).normalized())

func _on_ShootTimer_timeout():
	can_shoot = true
