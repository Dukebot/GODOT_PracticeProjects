class_name Weapon
extends Spatial

#Attacking
export var damage: float = 10
export var attack_cooldown: float = 0.2
var can_attack: bool = true

#Clip and reload
export var reload_time: float = 1.0
export var clip_size: int = 10 #Set to 0 for no reloading weapons
var reloading: bool = false
onready var clip_ammo: int = clip_size

onready var attack_rate_timer: Timer = $AttackRateTimer
onready var reload_timer: Timer = $ReloadTimer


func _on_AttackRateTimer_timeout():
	can_attack = true

func _on_ReloadTimer_timeout():
	reloading = false
	clip_ammo = clip_size


func primary_attack():
	if (clip_ammo > 0 or clip_size == 0) and can_attack and not reloading:
		print("Atacking...")
		can_attack = false
		clip_ammo -= 1
		attack_rate_timer.start(attack_cooldown)

func seconday_attack():
	pass

func reload():
	if not reloading and clip_ammo < clip_size:
		print("Reloading")
		reloading = true
		reload_timer.start(reload_time)









