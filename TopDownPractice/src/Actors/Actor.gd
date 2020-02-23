extends KinematicBody2D

#Will be the parent class of everything that can move and die
class_name Actor

export var max_speed := Vector2(500.0, 500.0) # pixels per second?
export var hit_points := 1.0

var velocity := Vector2.ZERO
