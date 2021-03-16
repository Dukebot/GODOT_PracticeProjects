extends "res://src/Actors/Actor.gd"

func _ready() -> void:
	#At the start we want to go to the opposite direction of the player (left)
	_velocity.x = -speed.x
	#Disabled until VisibilityEnabler activates the enemy
	set_physics_process(false)
	
func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	#Check if player is below than the area (we can't will from below)
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	#Disable Enemy Collision for enemy not to kill us (just for safe programming)
	get_node("CollisionShape2D").disabled = true
	# Delete the enemy
	queue_free()


func _physics_process(delta: float) -> void:
	if is_on_wall(): _velocity.x *= -1.0
	_velocity.y += gravity * delta
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y



