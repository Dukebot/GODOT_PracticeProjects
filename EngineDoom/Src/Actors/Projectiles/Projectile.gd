class_name Projectile
extends KinematicBody

var damage: float = 1
var speed: float = 1
var life_time: float = 1


func _process(delta):
	life_time -= delta
	if life_time <= 0:
		queue_free()


func _physics_process(delta):
	var direction: Vector3 = -global_transform.basis.z.normalized()
	var movement_vector: Vector3 = direction * speed
	
	var collider = move_and_collide(movement_vector * delta)
	if collider and "health_component" in collider.get_property_list():
		print("I make damage!")
		collider.health_component.damage(damage)
