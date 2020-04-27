extends Control


func _ready():
	var prompts = ["Yann", "banana", "tingly", "glorious"]
	var story = "One upon a time someone called %s and flavoured %s sandwich which made him feel all %s inside. It was %s day."
	
	var displayText = (story % prompts)
	$VBoxContainer/DisplayText.text = displayText


func _on_PlayerText_text_entered(new_text):
	update_DisplayText(new_text)

func _on_TextureButton_pressed():
	var words = $VBoxContainer/HBoxContainer/PlayerText.text
	update_DisplayText(words)

func update_DisplayText(words):
	$VBoxContainer/DisplayText.text = words
	$VBoxContainer/HBoxContainer/PlayerText.clear()



