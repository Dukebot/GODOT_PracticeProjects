extends Node

class_name TextValue

onready var text = $Text
onready var value = $Value

func set_text(_text: String):
	text.text = _text

func set_value(_value):
	value.text = str(_value)
