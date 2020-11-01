extends Node


func get_random_direction():
	Vector2.RIGHT.rotated(deg2rad(rand_range(0, 360)))
