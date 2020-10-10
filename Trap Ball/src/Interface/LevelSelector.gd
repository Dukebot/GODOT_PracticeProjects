extends Control

const NUM_WORLDS = Game.NUM_WORLDS

var world_selected = 1
var level_selected = 1


func load_level():
	Game.load_level(world_selected, level_selected)

func update_world_selected():
	$World.text = "World " + str(world_selected)


#World Selection

func _on_PrevWorldButton_pressed():
	world_selected -= 1
	if world_selected < 1: 
		world_selected = 1
	update_world_selected()

func _on_NextWorldButton_pressed():
	world_selected += 1
	if world_selected > NUM_WORLDS: 
		world_selected = NUM_WORLDS
	update_world_selected()



#Level Selection

func _on_Level1Button_pressed():
	level_selected = 1
	load_level()

func _on_Level2Button_pressed():
	level_selected = 2
	load_level()

func _on_Level3Button_pressed():
	level_selected = 3
	load_level()

func _on_Level4Button_pressed():
	level_selected = 4
	load_level()

func _on_Level5Button_pressed():
	level_selected = 5
	load_level()

func _on_Level6Button_pressed():
	level_selected = 6
	load_level()
