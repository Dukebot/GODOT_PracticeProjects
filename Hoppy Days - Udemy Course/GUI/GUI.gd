extends CanvasLayer

onready var lifeCount = $Control/TextureRect/HBoxContainer/LifeCount

func _ready():
	lifeCount.text = "3"

func update_lives(lives_left):
	lifeCount.text = str(lives_left)
