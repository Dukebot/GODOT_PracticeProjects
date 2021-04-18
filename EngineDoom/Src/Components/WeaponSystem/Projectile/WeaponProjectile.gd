class_name WeaponProjectile
extends Weapon

export (PackedScene) var Projectile
export (float) var projectile_speed = 10

func _primary_attack():
	
	var projectile = Projectile.instance()
	get_tree().current_scene.add_child(projectile)
	projectile.global_transform = shoot_raycast.global_transform
	projectile.damage = damage
	projectile.speed = projectile_speed
	projectile.add_collision_exception_with(owner)

