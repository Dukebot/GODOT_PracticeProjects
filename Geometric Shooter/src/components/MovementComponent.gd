extends Node

export var max_speed = 300
export var acceleration = 2000
export var friction = 2000

var direction = Vector2()
var velocity = Vector2()

func set_direction(value): direction = value
func bounce_x(): direction.x *= -1
func bounce_y(): 
	direction.y *= -1
	print("calling bounce Y, direction_y = " + str(direction.y))

#direction has to be normalized at this point
func move(delta):
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	velocity = get_parent().move_and_slide(velocity)


