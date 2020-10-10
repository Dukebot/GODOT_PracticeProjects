extends Node

const FORCE_NEW_GAME_CREATION = false

var savegame = File.new() #file
var save_path = "user://savegame.save" #place of the file  

#Se me pone en minúscula aunque lo ponga en mayúscula aquí
var save_data = {
	"level 1-1": 0.0, "level 1-2": 0.0, "level 1-3": 0.0,
	"level 1-4": 0.0, "level 1-5": 0.0, "level 1-6": 0.0,
	"level 2-1": 0.0, "level 2-2": 0.0, "level 2-3": 0.0,
	"level 2-4": 0.0, "level 2-5": 0.0, "level 2-6": 0.0,
	"level 3-1": 0.0, "level 3-2": 0.0, "level 3-3": 0.0,
	"level 3-4": 0.0, "level 3-5": 0.0, "level 3-6": 0.0
} #variable to store data


func _ready():
	if not savegame.file_exists(save_path) or FORCE_NEW_GAME_CREATION:
		savegame.open(save_path, File.WRITE) #open file to write
		savegame.store_var(save_data) #store the data
		savegame.close() # close the file
	else:
		savegame.open(save_path, File.READ) #open the file
		save_data = savegame.get_var() #get the value
		savegame.close() #close the file
	
	print(str(save_data))


func get_score(key): 
	return save_data[key.to_lower()]

func set_score(key, value): 
	save_data[key.to_lower()] = value


func save():
	savegame.open(save_path, File.WRITE) #open file to write
	savegame.store_var(save_data) #store the data
	savegame.close() # close the file
