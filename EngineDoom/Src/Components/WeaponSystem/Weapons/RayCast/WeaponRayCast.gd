class_name WeaponRayCast
extends Weapon


func _primary_attack():
	if not shoot_raycast.is_colliding():
		return
	
	var collider = shoot_raycast.get_collider()
	print(collider)
	
	if "health_component" in collider:
		collider.health_component.damage(damage)
	if collider is RigidBody:
		collider.apply_central_impulse(-shoot_raycast.get_collision_normal() * 100)
