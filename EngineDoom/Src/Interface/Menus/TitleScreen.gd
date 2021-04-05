extends Menu

const MAIN_TITLE_MUSIC_PATH = "res://Assets/Sound/Music/title_screen.ogg"

func _ready():
	if not BackgroundMusic.playing:
		BackgroundMusic.stream = load(MAIN_TITLE_MUSIC_PATH)
		BackgroundMusic.play()

func _process(delta):
	if Input.is_action_pressed("enter"):
		get_tree().change_scene(Globals.MAP_TEST_PATH)
