extends Area2D

signal pickup_sound

export var PickupSound = preload("res://src/Sound Players/CheckpointSound.tscn")

func _ready():
	connect("pickup_sound", get_tree().current_scene, "add_child_scene")

#Should only detect body in the player layer
func _on_Checkpoint_body_entered(body):
	body.set_respawn_position(self.position)
	body.set_respawn_time(get_tree().current_scene.get_time())
	emit_signal("pickup_sound", PickupSound, self.position)
	queue_free()
