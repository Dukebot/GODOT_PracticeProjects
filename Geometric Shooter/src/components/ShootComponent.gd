extends Node

class_name ShootComponent

export var ProjectileScene = preload("res://src/projectiles/PlayerPrimaryProjectile.tscn")
export var projectile_speed = 100
export var projectile_damage = 1
export var projectile_life_time = 1.0
export var fire_rate = 1.0

var can_shoot = true

onready var shoot_timer = $ShootTimer

func shoot(target_position):
	if can_shoot:
		can_shoot = false
		shoot_timer.start(fire_rate)
		create_projectile(target_position)
		$ShootSound2D.play()

func create_projectile(target_position):
	var projectile = ProjectileScene.instance()
	get_tree().current_scene.add_child(projectile)
	projectile.init(get_parent().position, target_position, projectile_speed, projectile_damage, projectile_life_time)

func _on_ShootTimer_timeout():
	can_shoot = true
