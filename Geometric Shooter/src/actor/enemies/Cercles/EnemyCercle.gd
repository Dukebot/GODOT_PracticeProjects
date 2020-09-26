extends Enemy

class_name EnemyCercle


func _ready():
	movement_component.set_random_direction()

func _physics_process(delta):
	movement_component.move(delta)

func bounce_x():
	movement_component.bounce_x()
	$Bounce.play()

func bounce_y(): 
	movement_component.bounce_y()
	$Bounce.play()
