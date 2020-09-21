extends Node

export var enemy_to_spawn = preload("res://src/actor/enemies/EnemyCercle.tscn")
export var spawn_rate = 2.0

func _ready():
	$Timer.start(spawn_rate)


func _on_Timer_timeout():
	var enemy = enemy_to_spawn.instance()
	get_tree().current_scene.add_child(enemy)
