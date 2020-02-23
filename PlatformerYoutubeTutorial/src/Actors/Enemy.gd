extends "res://src/Actors/Actor.gd"

func _ready() -> void:
	velocity.x = -speed.x
	set_physics_process(false)
	
func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	get_node("CollisionShape2D").disabled = true
	# Delete the enemy
	queue_free()


func _physics_process(delta: float) -> void:
	if is_on_wall(): velocity.x *= -1.0
	velocity.y += gravity * delta
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y



