class_name Player
extends Actor

signal no_lives()

var lives := 3

func _process(delta):
	position = get_global_mouse_position()

func _on_EnemyDetector_body_entered(body):
	print("Enemy hit!")
	body.queue_free()
	lives -= 1
	if lives <= 0:
		emit_signal("no_lives")
