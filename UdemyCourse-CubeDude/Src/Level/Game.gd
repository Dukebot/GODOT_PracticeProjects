extends Spatial


#Player 2 has scored a goal
func _on_GoalDetector1_body_entered(_body):
	print("Player 2 has scored")


#Player 1 has scored a goal
func _on_GoalDetector2_body_entered(_body):
	print("Player 1 has scored")
