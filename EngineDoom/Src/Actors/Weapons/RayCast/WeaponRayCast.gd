class_name WeaponRayCast
extends Weapon

onready var ray_casts: Spatial = $RayCasts


func _primary_attack():
	for ray_cast in ray_casts.get_children():
		var collider = ray_cast.get_collider()
		print(collider)
