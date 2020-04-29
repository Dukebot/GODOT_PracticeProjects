extends Control

var player_words = []

var template = [
	{
		"prompts": ["a name", "a noun", "adverb", "adjective"],
		"story": "One upon a time someone called %s and flavoured %s sandwich which made him feel all %s inside. It was %s day."
	}, {
		"story": "There once was %s called %s who searched far and wide for the mythical %s noun of %s",
		"prompts": ["a noun", "a name", "an adjective", "another name"]
	}
]

var current_story

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText


func _ready():
	set_current_story()
	DisplayText.text = "Wellcome to Loony Lips! We're going to tell a story and have a wonderful time!"
	check_player_words_length()
	PlayerText.grab_focus()


func set_current_story():
	randomize()
	current_story = template[randi() % template.size()]


func _on_PlayerText_text_entered(new_text):
	add_to_player_words()


func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()


func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ""
	PlayerText.clear()
	check_player_words_length()


func is_story_done():
	return player_words.size() == current_story.prompts.size()


func check_player_words_length():
	if is_story_done():
		end_game()
	else:
		promp_player()


func tell_story():
	DisplayText.text = current_story.story % player_words


func promp_player():
	DisplayText.text += "May I have " + current_story.prompts[player_words.size()] + " please?"


func end_game():
	PlayerText.queue_free()
	$VBoxContainer/HBoxContainer/Label.text = "Again!"
	tell_story()
