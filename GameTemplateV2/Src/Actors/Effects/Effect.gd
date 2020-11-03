extends AnimatedSprite

var animation_finished := false
var sound_finished := false

onready var sound_effect = $SoundEffect


func _ready():
	sound_effect.play()
	self.play("default")


func _on_EffectTemplate_animation_finished():
	animation_finished = true
	if animation_finished and sound_finished:
		queue_free()


func _on_SoundEffect_finished():
	sound_finished = true
	if animation_finished and sound_finished:
		queue_free()
