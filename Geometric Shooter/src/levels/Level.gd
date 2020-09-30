extends Node2D

class_name Level

onready var player = $Player
onready var enemy_spawner = $EnemySpawner

func _ready():
	pass

func get_player(): return player
func get_enemy_spawner(): return enemy_spawner


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


func _on_LevelUp_timeout():
	print("Increasing spawn rate...")
	$EnemySpawner.increase_spawn_rate()
