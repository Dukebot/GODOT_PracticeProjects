class_name WeaponComponent
extends Node

export (NodePath) var shoot_raycast_path

var current_weapon := 0

onready var shoot_raycast: RayCast = get_node(shoot_raycast_path)


func _ready():
	for weapon in get_children():
		assert(weapon is Weapon)
		weapon.shoot_raycast = shoot_raycast


func add_weapon(weapon: Weapon):
	assert(weapon is Weapon)
	add_child(weapon)
	weapon.shoot_raycast = shoot_raycast


func get_weapons():
	return get_children()


func primary_attack():
	get_child(current_weapon).primary_attack()


#Weapon Switching

func switch_to_weapon(weapon_index: int):
	current_weapon = weapon_index
	if current_weapon < 0: 
		current_weapon = 0
	if current_weapon >= get_weapons().size(): 
		current_weapon = get_weapons().size() - 1
	print_current_weapon()


func next_weapon():
	current_weapon += 1
	if current_weapon >= get_weapons().size():
		current_weapon = 0
	print_current_weapon()


func previous_weapon():
	current_weapon -= 1
	if current_weapon < 0:
		current_weapon = get_weapons().size() - 1
	print_current_weapon()


func print_current_weapon():
	print("Current Weapon is " + str(current_weapon) + " - " + get_child(current_weapon).name)
