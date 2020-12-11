extends Node2D

var color := Color()
var size := 1.0


func get_position() -> Vector2: return position
func set_position(pos: Vector2): position = pos

func get_color() -> Color: return color
func set_color(_color: Color): color = _color

func get_size() -> float: return size
func set_size(_size: float): size = _size
