extends KinematicBody2D

#Parent class for our player and enemies
class_name Actor

#Used to pass to function move_and_slide()
const FLOOR_NORMAL := Vector2.UP

export var speed := Vector2(300.0, 1000.0)
export var gravity := 4000.0

# Veclocity vector, also called motion, movement or speedX and speedY
var _velocity := Vector2.ZERO
