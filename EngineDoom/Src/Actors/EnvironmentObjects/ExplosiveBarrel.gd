class_name ExplosiveBarrel
extends StaticBody


const damage_area_scene = preload("res://Src/Areas/DamageArea.tscn")

export (float) var explosion_damage = 50.0
export (float) var explosion_radius = 2.0
export (float) var explosion_duration = 0.1

onready var health_component = $HealthComponent


func _on_HealthComponent_no_health():
	var damage_area = damage_area_scene.instance()
	get_tree().current_scene.add_child(damage_area)
	damage_area.transform = transform
	damage_area.init(explosion_damage, explosion_radius, explosion_duration)
	queue_free()
