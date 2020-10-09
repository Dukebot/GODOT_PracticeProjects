extends TextureButton

signal unpause

func _ready():
	connect("unpause", get_tree().current_scene, "unpause")

func _on_ContinueTextureButton_pressed():
	emit_signal("unpause")
