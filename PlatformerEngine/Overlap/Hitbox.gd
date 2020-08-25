extends Area2D

export var damage = 1

#Should only be configured to detect only areas of hurtbox mask
func _on_Hitbox_area_entered(area):
	print("Hitbox has found a hurtbox...")
	area.hit(damage)
