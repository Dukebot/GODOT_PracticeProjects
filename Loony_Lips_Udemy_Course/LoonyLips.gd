extends Control

func _ready():
	var prompts
	var story = "One upon a time someone called %s and flavoured %s sandwich which made him feel all %s inside. It was %s day."
	
	prompts = ["Yann", "banana", "tingly", "glorious"]
	print(story % prompts)
	
	prompts = ["Izkat", "ham", "catly", "normal"]
	print(story % prompts)
