extends TextureButton

signal next_level

func _ready():
	connect("next_level", get_tree().current_scene, "load_next_level")

func _on_NextLevelTextureButton_pressed():
	emit_signal("next_level")
