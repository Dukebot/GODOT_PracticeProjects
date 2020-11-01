extends KinematicBody2D

class_name Player

onready var input = GlobalInput
onready var movement = $PlatformerMovementComponent
onready var health = $HealthComponent
onready var hitbox = $HitboxComponent

var look_direction := 1


func _ready():
	hitbox.disable_collision()

func _physics_process(delta):
	var direction = input.get_horizontal_direction()
	if direction != 0:
		look_direction = direction
	movement.move(direction, input.is_jumping(), delta)
	hitbox.position = Vector2(50, 0) * look_direction
	if input.is_attacking():
		hitbox.enable_collision(0.1)

#Should only be detectable by HitboxComponent
func _on_HurtboxComponent_area_entered(area):
	health.take_damage(area.damage)

func _on_HealthComponent_no_health():
	destroy()

func destroy():
	queue_free()
