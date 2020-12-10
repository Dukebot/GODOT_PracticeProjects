extends Area2D

enum ACTION {none, teleport}

export(ACTION) var action = ACTION.none
export var interaction_text = ["Text"]
export var teleport_zone = "MainZone"

var interacting_character = null
var interaction_number = 0

onready var teleport_zone_scene = "res://SRC/Zones/" + teleport_zone + ".tscn"

onready var label = $Label


func _ready():
	set_process(false)

func _process(delta):
	if InputManager.interact_just_pressed():
		if interaction_number < interaction_text.size():
			set_text(interaction_text[interaction_number])
			interaction_number += 1
		else:
			if action == ACTION.teleport:
				get_tree().change_scene(teleport_zone_scene)
			restart_interaction()

func restart_interaction():
	interaction_number = 0
	init_text()

func _on_Interaction_body_entered(body):
	interacting_character = body
	init_text()
	set_process(true)

func _on_Interaction_body_exited(body):
	interacting_character = null
	interaction_number = 0
	clear_text()
	set_process(false)


func set_text(text):
	label.text = text

func init_text():
	label.text = "!"

func clear_text():
	label.text = ""
