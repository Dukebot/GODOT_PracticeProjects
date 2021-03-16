extends Node2D

const GrassEffect = preload("res://Effects/GrassEffect.tscn")

func _on_HurtBox_area_entered(area):
	create_grass_effect()
	queue_free()

func create_grass_effect():
	var grassEffect = GrassEffect.instance()
	grassEffect.global_position = global_position
	#var world = get_tree().current_scene #get the main scene node
	get_parent().add_child(grassEffect)
