extends KinematicBody2D

signal dead_effect

export var DeadParticle = preload("res://src/Effects/Particle.tscn")

var respawn_position = Vector2()
var is_alive = true

onready var input_component = $InputComponent
onready var movement_component = $MovementComponent
onready var respawn_timer = $RespawnTimer
onready var bounce_sound = $Bounce

func _ready():
	connect("dead_effect", get_tree().current_scene, "create_effect")
	respawn_position = position

func _physics_process(delta):
	var direction = input_component.get_horizontal_direction()
	movement_component.move(direction, delta)
	if position.y > 1000:
		die()

func _on_Hitbox_area_entered(area):
	die()

func die():
	if is_alive:
		is_alive = false
		set_physics_process(false)
		set_visible(false)
		create_dead_particles()
		movement_component.stop()
		respawn_timer.start()

func _on_RespawnTimer_timeout():
	position = respawn_position
	is_alive = true
	set_physics_process(true)
	set_visible(true)

func set_respawn_position(_position):
	respawn_position = _position

func boost_jump():
	movement_component.JUMP_SPEED *= 2

func unboost_jump():
	movement_component.JUMP_SPEED /= 2

func play_bounce_sound():
	bounce_sound.play()

func create_dead_particles():
	for i in range(20):
		emit_signal("dead_effect", DeadParticle, position)
