class_name WeaponRayCast
extends Weapon


func _primary_attack():
	var collider = shoot_raycast.get_collider()
	print(collider)
	if collider is RigidBody:
		collider.apply_central_impulse(-shoot_raycast.get_collision_normal() * 100)
