extends Control

func set_time(time):
	time = stepify(time, 0.01)
	$TimeValue.text = str(time)

func set_best_time(time):
	time = stepify(time, 0.01)
	$BestTimeValue.text = str(time)
