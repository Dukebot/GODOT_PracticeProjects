extends Node2D

class_name Projectile


export var speed = 0
export var damage = 0
export var life_time = 1.0

export var Particle = preload("res://src/effects/PlayerShootParticle.tscn")
export var HitSoundPlayer = preload("res://src/sound players/HitSoundPlayer.tscn")

var direction = Vector2()

onready var sprite = $Sprite
onready var timer = $Timer

func _ready():
	timer.start(life_time)

func set_direction(_direction):
	direction = _direction

func _process(delta):
	rotation = direction.angle()
	position += direction * speed * delta

func _on_HitboxComponent_body_entered(body):
	create_hit_sound()
	destroy()

func _on_Timer_timeout():
	destroy()

func destroy():
	create_particles(20)
	queue_free()


func create_hit_sound():
	var hit_sound_player = HitSoundPlayer.instance()
	get_tree().current_scene.add_child(hit_sound_player)
	hit_sound_player.play()

func create_particles(num_particles):
	for i in range(num_particles):
		var particle = Particle.instance()
		get_tree().current_scene.add_effect(particle)
		particle.position = position
