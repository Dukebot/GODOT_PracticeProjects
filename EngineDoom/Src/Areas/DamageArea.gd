extends Area

export (bool) var auto_init = false
export (float) var damage = 1
export (float) var radius = 1
export (float) var life_time = 1

onready var life_time_timer = $LifeTimeTimer
onready var collision = $CollisionShape

func _ready():
	if auto_init:
		init(damage, radius, life_time)

func init(damage: float, radius: float, life_time: float):
	self.damage = damage
	self.radius = radius
	self.life_time = life_time
	
	collision.shape = SphereShape.new()
	collision.shape.radius = radius
	
	if life_time > 0:
		life_time_timer.start(life_time)

func _on_DamageArea_body_entered(body):
	if "health_component" in body.get_property_list():
		body.health_component.damage(damage)

func _on_LifeTimeTimer_timeout():
	queue_free()
