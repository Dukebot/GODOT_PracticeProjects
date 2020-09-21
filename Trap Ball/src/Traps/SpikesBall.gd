extends Area2D

export var speed_x = 0
export var speed_y = 0
export var change_dir_time = 0.0

onready var movement_component = $SimpleMovementComponent

func _ready():
	movement_component.init(speed_x, speed_y, change_dir_time)
