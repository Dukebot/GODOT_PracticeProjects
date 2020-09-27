extends Node2D

class_name Level

onready var player = $Player

func _ready():
	pass


func get_player(): return player


#Adding objects to the scene

func add_object(ObjectScene, _position):
	var object = ObjectScene.instance()
	object.position = _position
	add_child(object)

func add_enemy(EnemyScene, _position):
	var enemy = EnemyScene.instance()
	enemy.position = _position
	$Enemies.add_child(enemy)

func add_effect(EffectScene, _position): 
	var effect = EffectScene.instance()
	effect.position = _position
	$Effects.add_child(effect)

func add_projectile(ProjectileScene, initial_position, target_position):
	var projectile = ProjectileScene.instance()
	projectile.position = initial_position
	$Projectiles.add_child(projectile)
	projectile.set_direction((target_position - initial_position).normalized())
