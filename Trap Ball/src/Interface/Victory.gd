extends Control

func set_time(time):
	$Time.text = "Time " + str(time)

func set_best_time(best_time):
	$BestTime.text = "Best Time " + str(best_time)
