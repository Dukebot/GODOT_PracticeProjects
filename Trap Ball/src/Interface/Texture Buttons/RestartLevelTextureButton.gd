extends TextureButton

signal restart_level

func _ready():
	connect("restart_level", get_tree().current_scene, "restart_level")

func _on_RestartLevelTextureButton_pressed():
	emit_signal("restart_level")
