class_name Weapon
extends Node

export (float) var damage = 10
export (float) var attack_cooldown = 0.2
export (int) var number_of_projectiles = 5
export (float) var shake_amount = 5



#TODO add shake amount for projectile deviation

var can_attack: bool = true
var shoot_raycast: RayCast

onready var attack_rate_timer: Timer = $AttackRateTimer


func _on_AttackRateTimer_timeout():
	can_attack = true


func primary_attack():
	if can_attack:
		print("Atacking...")
		can_attack = false
		for i in number_of_projectiles:
			shoot_raycast.rotation_degrees = get_shake_vector()
			shoot_raycast.force_raycast_update()
			_primary_attack()
		attack_rate_timer.start(attack_cooldown)


func seconday_attack():
	pass


#Override on children
func _primary_attack():
	pass


func get_shake_vector() -> Vector3:
	var shake_vector = Vector3(rand_range(-shake_amount, shake_amount), 
			rand_range(-shake_amount, shake_amount), 
			rand_range(-shake_amount, shake_amount))
	return shake_vector
