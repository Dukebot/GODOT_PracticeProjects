extends Area2D

export var damage = 1

func _on_Hitbox_area_entered(area):
	area.take_damage(damage)
