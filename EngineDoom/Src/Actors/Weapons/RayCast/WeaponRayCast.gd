class_name WeaponRayCast
extends Weapon

onready var ray_casts: Spatial = $RayCasts

func primary_attack():
	if (clip_ammo > 0 or clip_size == 0) and can_attack and not reloading:
		print("Atacking...")
		can_attack = false
		clip_ammo -= 1
		for ray_cast in ray_casts.get_children():
			var collider = ray_cast.get_collider()
			print(collider)
		attack_rate_timer.start(attack_cooldown)
