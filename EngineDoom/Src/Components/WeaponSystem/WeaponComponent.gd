class_name WeaponComponent
extends Node


export (NodePath) var shoot_raycast_path
onready var shoot_raycast: RayCast = get_node(shoot_raycast_path)


func _ready():
	for weapon in get_children():
		assert(weapon is Weapon)
		weapon.shoot_raycast = shoot_raycast


func primary_attack():
	get_child(0).primary_attack()
