extends AnimatedSprite

func _ready():
	connect("animation_finished", self, "_on_animation_finished")
	frame = 0 #make sure we always play from the very start (replases what's set in the editor)
	play("Animate")
	$AudioStreamPlayer2D.play()

func _on_animation_finished():
	queue_free()
