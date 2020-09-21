extends KinematicBody2D

class_name Actor

export var health = 3

export var max_speed = 300
export var acceleration = 2000
export var friction = 2000

export var primary_fire = preload("res://src/projectiles/PlayerPrimaryProjectile.tscn")
export var secondary_fire = preload("res://src/projectiles/PlayerPrimaryProjectile.tscn")
export var special_attack = preload("res://src/projectiles/PlayerPrimaryProjectile.tscn")

var direction = Vector2()
var velocity = Vector2()


func move(delta):
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	velocity = move_and_slide(velocity)


func shoot_primary_fire(target_position):
	create_projectile(primary_fire, target_position)

func shoot_secondary_fire(target_position):
	create_projectile(secondary_fire, target_position)

func shoot_special_attack(target_position):
	create_projectile(special_attack, target_position)

func create_projectile(projectile_scene, target_position):
	var projectile = projectile_scene.instance()
	projectile.init(position, target_position)
	get_tree().current_scene.add_child(projectile)


func take_damage(amount):
	health -= amount
	if health <= 0:
		destroy()

func destroy():
	queue_free()
