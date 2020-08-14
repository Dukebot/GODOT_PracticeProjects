extends Node2D


var timeout = false

onready var timer = $Sprite/Timer
onready var ray_cast = $Sprite/RayCast2D


func _process(delta):
	if ray_cast.is_colliding():
		fire()


func fire():
	if not timeout:
		ray_cast.add_child( load("res://NPCs/Lightning.tscn").instance() )
		timer.start()
		timeout = true


func _on_Timer_timeout():
	timeout = false
