class_name Weapon
extends Spatial


export (float) var damage = 10
export (float) var attack_cooldown = 0.2
export (float) var reload_time = 1.0

export (int) var clip_size = 10 #Set to 0 for no reloading weapons

export (NodePath) var inventory_component_path
export (NodePath) var shoot_raycast_path


var can_attack: bool = true
var reloading: bool = false


onready var clip_ammo: int = clip_size

onready var attack_rate_timer: Timer = $AttackRateTimer
onready var reload_timer: Timer = $ReloadTimer

#Dependencies from other nodes
onready var inventory_component: InventoryComponent = get_node(inventory_component_path)
onready var shoot_raycast: RayCast = get_node(shoot_raycast_path)



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
		_primary_attack()
		attack_rate_timer.start(attack_cooldown)


func seconday_attack():
	pass


func reload():
	if not reloading and clip_ammo < clip_size:
		print("Reloading")
		reloading = true
		reload_timer.start(reload_time)


#Override on children
func _primary_attack():
	pass
