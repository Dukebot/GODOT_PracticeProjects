class_name WeaponProjectile
extends Weapon

export (PackedScene) var Projectile
export (int, 1, 999) var number_of_projectiles = 1
export (float) var projectile_speed = 10

func _primary_attack():
	for i in number_of_projectiles:
		var projectile = Projectile.instance()
		get_tree().current_scene.add_child(projectile)
		projectile.global_transform = global_transform
		projectile.damage = damage
		projectile.speed = projectile_speed
		projectile.add_collision_exception_with(owner)

