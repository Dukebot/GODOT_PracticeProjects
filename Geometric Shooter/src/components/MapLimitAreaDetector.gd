extends Area2D

signal bounce_x
signal bounce_y

func _ready():
	connect("bounce_x", get_parent(), "bounce_x")
	connect("bounce_y", get_parent(), "bounce_y")

func bounce_x(): emit_signal("bounce_x")
func bounce_y(): emit_signal("bounce_y")
