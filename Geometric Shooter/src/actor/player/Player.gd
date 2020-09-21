extends Actor

class_name Player

onready var input_component = $InputComponent
onready var primary_fire = $PrimaryFire
onready var secondary_fire = $SecondaryFire

func _physics_process(delta):
	var direction = input_component.get_input_vector()
	movement_component.set_direction(direction)
	movement_component.move(delta)
	shoot()

func shoot():
	var mouse_pos = get_global_mouse_position()
	if input_component.is_primary_fire_shooting():
		shoot_primary_fire(mouse_pos)
	if input_component.is_secondary_fire_shooting():
		shoot_secondary_fire(mouse_pos)
	if input_component.is_special_attack_shooting():
		shoot_special_attack(mouse_pos)


func shoot_primary_fire(target_position):
	primary_fire.shoot(target_position)

func shoot_secondary_fire(target_position):
	secondary_fire.shoot(target_position)

func shoot_special_attack(target_position):
	print("Special Attack")
