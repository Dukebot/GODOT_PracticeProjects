extends AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	frame = 0
	$Sound.play()
	play("Animate")


func _on_HitEffect_animation_finished():
	queue_free()
