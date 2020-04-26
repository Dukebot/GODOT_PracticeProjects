extends Control

func _ready():
	var prompts = ["Yann", "banana", "tingly", "glorious"]
	var story = "One upon a time someone called %s and flavoured %s sandwich which made him feel all %s inside. It was %s day."
	
	var displayText = (story % prompts)
	$DisplayText.text = displayText
