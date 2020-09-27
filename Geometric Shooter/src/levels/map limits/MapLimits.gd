extends Node



func _on_MapHorizontalLimit_area_entered(area):
	area.bounce_x()


func _on_MapVerticalLimit_area_entered(area):
	area.bounce_y()
