extends Node

signal create_effect(Effect, position)

export var Effect : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("create_effect", get_tree().current_scene, "create_effect")

func create(position):
	emit_signal("create_effect", Effect, position)
