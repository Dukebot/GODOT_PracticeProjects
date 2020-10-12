extends AnimatedSprite

var animation_finished
var sound_finished


# Called when the node enters the scene tree for the first time.
func _ready():
	frame = 0
	$Sound.play()
	play("default")

func _on_Effect_animation_finished():
	set_visible(false)
	animation_finished = true
	destroy()

func _on_Sound_finished():
	sound_finished = true
	destroy()

func destroy():
	if animation_finished and sound_finished:
		queue_free()
