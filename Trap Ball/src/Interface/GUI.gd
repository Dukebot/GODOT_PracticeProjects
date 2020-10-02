extends CanvasLayer

var time = 0.0
var pause = false

func _process(delta):
	if not pause:
		time += delta
		$Control/Label.text = "TIME " + str(time)

func pause(): pause = true
func unpause(): pause = false
