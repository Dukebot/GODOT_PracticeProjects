extends TextureButton

signal pause

func _ready():
	connect("pause", get_tree().current_scene, "pause")

func _on_PauseTextureButton_pressed():
	emit_signal("pause")
