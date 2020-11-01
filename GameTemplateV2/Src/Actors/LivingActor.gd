extends KinematicBody2D

class_name LivingActor

onready var health = $HealthComponent
onready var movement = $PlatformerMovementComponent
onready var hit_effect = $HitEffectCreator
onready var dead_effect = $DeadEffectCreator
onready var hurtbox = $HurtboxComponent
onready var hitbox = $HitboxComponent

onready var sprite = $Sprite
onready var collision = $CollisionShape2D


func _ready():
	pass

func _physics_process(delta):
	movement.move(get_input_direction(), get_iunput_jump(), delta)
	pass

func get_input_direction():
	return 0

func get_iunput_jump():
	return false


func _on_HurtboxComponent_area_entered(area):
	health.take_damage(area.damage)

func _on_HealthComponent_hit():
	hit_effect.create(position)

func _on_HealthComponent_no_health():
	destroy()

func destroy():
	dead_effect.create(position)
	queue_free()
