class_name Player
extends Actor

func _process(delta):
	position = get_global_mouse_position()


func _on_EnemyDetector_body_entered(body):
	print("Enemy hit!")
