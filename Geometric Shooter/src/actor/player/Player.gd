extends Actor

class_name Player

signal player_died

onready var input_component = $InputComponent
onready var primary_fire = $PrimaryFire
onready var secondary_fire = $SecondaryFire

func _ready():
	#Aun no se ha creado...
	connect("player_died", get_tree().current_scene.get_enemy_spawner(), "stop")

func _physics_process(delta):
	move(delta)
	attack()

func move(delta):
	var direction = input_component.get_input_vector()
	movement_component.set_direction(direction)
	movement_component.move(delta)

func attack():
	var mouse_pos = get_global_mouse_position()
	
	if input_component.is_primary_fire_shooting():
		primary_fire.shoot(mouse_pos)
	
	elif input_component.is_secondary_fire_shooting():
		secondary_fire.shoot(mouse_pos)
	
	elif input_component.is_special_attack_shooting():
		print("Special Attack")

func destroy():
	emit_signal("spawn_effect", DestroyEffect, position)
	emit_signal("player_died")
	queue_free()
