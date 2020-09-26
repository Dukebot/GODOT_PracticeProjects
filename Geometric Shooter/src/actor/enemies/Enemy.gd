extends Actor

class_name Enemy

export var damage = 1

func _ready():
	#Enemies are invincible a little time after spawning
	#health_component.set_invincibility(1.0)
	pass

func _on_HitboxComponent_body_entered(body):
	destroy()
