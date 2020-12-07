extends Area2D

class_name Interaction

#Examination messages
export var messages := ["Test message"]

#Interaction that teleports to another zone
export var zone_name := "Zone"

export var can_teleport := false

var interaction_number = 0

onready var zone_path = "res://src/zones/" + zone_name + ".tscn"

onready var label = $Label

#Private

func _on_Interaction_body_entered(body):
	set_default_text()

func _on_Interaction_body_exited(body):
	label.text = ""
	interaction_number = 0

func set_default_text():
	label.text = "E - Examinate"
	if can_teleport: label.text += "\nF - Enter"

#Public

func examinate():
	if interaction_number == messages.size():
		set_default_text()
		interaction_number = 0
	else:
		interaction_number += 1
		label.text = messages[interaction_number - 1]


func interact():
	if can_teleport: 
		get_tree().change_scene(zone_path)






