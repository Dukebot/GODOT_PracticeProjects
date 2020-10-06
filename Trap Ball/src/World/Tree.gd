extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	scale = scale * rand_range(0.75, 1.5)

