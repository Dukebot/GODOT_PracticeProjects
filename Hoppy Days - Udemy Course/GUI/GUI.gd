extends CanvasLayer

onready var lifeCount = $Control/TextureRect/HBoxContainer/LifeCount
onready var coinCount = $Control/TextureRect/HBoxContainer/CoinCount

func _ready():
	lifeCount.text = "3"

func update_GUI(lives_left, coins):
	lifeCount.text = str(lives_left)
	coinCount.text = str(coins)
