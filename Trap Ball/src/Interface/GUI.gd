extends CanvasLayer

var time = 0.0
var pause = false

func _ready():
	$Control/VBoxContainer/Level.text = get_tree().current_scene.name

func _process(delta):
	if not pause:
		time += delta
		$Control/VBoxContainer/Time.text = "TIME " + str(time)

func pause(): pause = true
func unpause(): pause = false
