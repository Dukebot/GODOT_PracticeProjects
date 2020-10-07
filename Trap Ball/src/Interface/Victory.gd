extends CanvasLayer

func set_time(time):
	$Control/Time.text = "Time " + str(time)

func set_best_time(best_time):
	$Control/BestTime.text = "Best Time " + str(best_time)

func set_visible(value):
	$Control.set_visible(value)
