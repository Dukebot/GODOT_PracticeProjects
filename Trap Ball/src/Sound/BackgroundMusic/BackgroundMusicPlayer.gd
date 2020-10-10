extends AudioStreamPlayer

func _ready():
	play()

func _on_BackgroundMusicPlayer_finished():
	play()
