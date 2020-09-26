extends Node


export var enemies_to_spawn = [
	preload("res://src/actor/enemies/Cercles/EnemyCercle.tscn"),
	preload("res://src/actor/enemies/squares/EnemySquare.tscn"),
	preload("res://src/actor/enemies/triangles/EnemyTriangle.tscn")
]

export var spawn_rate = 2.0

func _ready():
	$Timer.start(spawn_rate)


func _on_Timer_timeout():
	var rand_index = get_random_enemy_index()
	var spawn_position = get_random_spawn_position_node()
	
	var enemy = enemies_to_spawn[rand_index].instance()
	get_tree().current_scene.add_enemy(enemy)
	enemy.position = spawn_position.position


func get_random_enemy_index():
	randomize()
	var rand_index : int = randi() % enemies_to_spawn.size()
	return rand_index

func get_random_spawn_position_node():
	var random_value : int = randi() % 4
	if random_value == 0: return $SpawnPosition1
	elif random_value == 1: return $SpawnPosition2
	elif random_value == 2: return $SpawnPosition3
	elif random_value == 3: return $SpawnPosition4
