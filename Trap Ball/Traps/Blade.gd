extends Area2D


export var speed_x = 150
export var change_dir_time = 1.0

onready var movement_component = $SimpleMovement
onready var sprite = $Sprite


func _ready():
	print("Blade ready")
	movement_component.init(speed_x, 0, change_dir_time)


func _process(delta):
	if movement_component.direction > 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
