extends Node2D

class_name Level

onready var player = $Player

func get_player(): return player

func add_enemy(enemy_instance): $Enemies.add_child(enemy_instance)
func add_effect(effect_instance): $Effects.add_child(effect_instance)
