extends KinematicBody2D

signal set_time
signal create_dead_particles
signal create_hit_effect

export var DeadParticle = preload("res://src/Effects/Particle.tscn")
export var HitEffect = preload("res://src/Effects/HitEffect.tscn")

var respawn_position = Vector2()
var respawn_time = 0.0
var is_alive = true

onready var movement_component = $MovementComponent
onready var respawn_timer = $RespawnTimer
onready var bounce_sound = $Bounce
onready var collision_shape = $CollisionShape2D

onready var root = get_tree().current_scene


func _ready():
	connect("create_dead_particles", root, "add_effect_scenes")
	connect("create_hit_effect", root, "add_effect_scene")
	connect("set_time", root, "set_time")
	respawn_position = position


func set_direction(_direction): movement_component.set_direction(_direction)
func get_direction(): return movement_component.get_direction()


func _physics_process(delta):
	var direction = root.get_player_direction()
	if OS.get_name() != "Android":
		direction = get_horizontal_direction()
	set_sprite_orientation(direction)
	movement_component.set_direction(direction)
	movement_component.move(delta)
	if position.y > 500:
		die()


func get_horizontal_direction():
	var direction = 0
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		direction = -1
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		direction = 1
	return direction


func set_sprite_orientation(direction):
	if direction > 0: $Sprite.flip_h = false
	elif direction < 0: $Sprite.flip_h = true


func _on_Hitbox_area_entered(_area):
	die()


func die():
	if is_alive:
		is_alive = false
		set_physics_process(false)
		set_visible(false)
		movement_component.stop()
		respawn_timer.start()
		collision_shape.set_deferred("disabled", true)
		emit_signal("create_hit_effect", HitEffect, position)
		emit_signal("create_dead_particles", DeadParticle, position, 20)
		#emit_signal("set_time", respawn_time)


func _on_RespawnTimer_timeout():
	position = respawn_position
	is_alive = true
	set_visible(true)
	set_physics_process(true)
	
	#We do this to avoid bug when we die and we are on the floor
	#We respawn jumping with the bug, so we set it to 0
	var jump_speed_previous = movement_component.JUMP_SPEED
	movement_component.JUMP_SPEED = 0

	yield(get_tree().create_timer(.1), "timeout")
	collision_shape.disabled = false
	movement_component.JUMP_SPEED = jump_speed_previous


func set_respawn_position(_position):
	respawn_position = _position

func set_respawn_time(time):
	respawn_time = time


func boost_jump():
	movement_component.JUMP_SPEED *= 2

func unboost_jump():
	movement_component.JUMP_SPEED /= 2


func bounce():
	bounce_sound.play()
