extends Enemy

class_name EnemyCercle

#var initial_direction = Vector2(rand_range(-1.0, 1.0), rand_range(-1.0, 1.0))
var initial_direction = Vector2(1, 0).rotated(rand_range(0, 360)).normalized()

func _ready():
	movement_component.set_direction(initial_direction)

func _physics_process(delta):
	movement_component.move(delta)

func bounce_x():
	movement_component.bounce_x()
	$Bounce.play()

func bounce_y(): 
	movement_component.bounce_y()
	$Bounce.play()
