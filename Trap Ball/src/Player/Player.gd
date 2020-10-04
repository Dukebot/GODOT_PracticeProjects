extends KinematicBody2D

signal create_dead_particles

export var DeadParticle = preload("res://src/Effects/Particle.tscn")

var respawn_position = Vector2()
var is_alive = true

onready var input_component = $InputComponent
onready var movement_component = $MovementComponent
onready var respawn_timer = $RespawnTimer
onready var bounce_sound = $Bounce
onready var hit_sound = $Hit

func _ready():
	connect("create_dead_particles", get_tree().current_scene, "add_effect_scenes")
	respawn_position = position

func _physics_process(delta):
	var direction = input_component.get_horizontal_direction()
	set_sprite_orientation(direction)
	movement_component.move(direction, delta)
	if position.y > 1000:
		die()

func set_sprite_orientation(direction):
	if direction > 0: $Sprite.flip_h = false
	elif direction < 0: $Sprite.flip_h = true

func _on_Hitbox_area_entered(area):
	die()

func die():
	if is_alive:
		is_alive = false
		set_physics_process(false)
		set_visible(false)
		hit_sound.play()
		movement_component.stop()
		respawn_timer.start()
		emit_signal("create_dead_particles", DeadParticle, position, 30)

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
