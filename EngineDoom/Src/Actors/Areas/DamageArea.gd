extends Area

export (float) var damage = 1
export (float) var life_time = 0



func _on_DamageArea_body_entered(body):
	if "health_component" in body.get_property_list():
		body.health_component.damage(damage)
