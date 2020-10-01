extends AudioStreamPlayer2D

func _ready():
	play()

func _on_SoundPlayer_finished():
	queue_free()
