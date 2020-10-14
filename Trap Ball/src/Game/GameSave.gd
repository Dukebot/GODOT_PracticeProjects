extends Node

var savegame = File.new() #file
var save_path = "user://savegame.save" #place of the file
var save_data = {} #variable to store data

#Se me pone en minúscula aunque lo ponga en mayúscula aquí
const initial_save_data = {
	"current_world": 1,
	"level 1-1": 0.0, "level 1-2": 0.0, "level 1-3": 0.0,
	"level 1-4": 0.0, "level 1-5": 0.0, "level 1-6": 0.0,
	"level 2-1": 0.0, "level 2-2": 0.0, "level 2-3": 0.0,
	"level 2-4": 0.0, "level 2-5": 0.0, "level 2-6": 0.0,
	"level 3-1": 0.0, "level 3-2": 0.0, "level 3-3": 0.0,
	"level 3-4": 0.0, "level 3-5": 0.0, "level 3-6": 0.0,
	"level 4-1": 0.0, "level 4-2": 0.0, "level 4-3": 0.0,
	"level 4-4": 0.0, "level 4-5": 0.0, "level 4-6": 0.0,
	"level 5-1": 0.0, "level 5-2": 0.0, "level 5-3": 0.0,
	"level 5-4": 0.0, "level 5-5": 0.0, "level 5-6": 0.0,
	"level 6-1": 0.0, "level 6-2": 0.0, "level 6-3": 0.0,
	"level 6-4": 0.0, "level 6-5": 0.0, "level 6-6": 0.0,
	"level 7-1": 0.0, "level 7-2": 0.0, "level 7-3": 0.0,
	"level 7-4": 0.0, "level 7-5": 0.0, "level 7-6": 0.0,
	"level 8-1": 0.0, "level 8-2": 0.0, "level 8-3": 0.0,
	"level 8-4": 0.0, "level 8-5": 0.0, "level 8-6": 0.0,
}

func _ready():
	if not savegame.file_exists(save_path):
		save_data = initial_save_data.duplicate()
		savegame.open(save_path, File.WRITE) #open file to write
		savegame.store_var(save_data) #store the data
		savegame.close() # close the file
	else:
		savegame.open(save_path, File.READ) #open the file
		save_data = savegame.get_var() #get the value
		savegame.close() #close the file
	
	#Make sure that we add new keys if added
	for key in initial_save_data.keys():
		if not save_data.has(key):
			save_data[key] = initial_save_data[key]


func get_score(key):
	key = key.to_lower()
	if save_data.has(key):
		return save_data[key]
	return null

func set_score(key, value): 
	key = key.to_lower()
	if save_data.has(key):
		save_data[key.to_lower()] = value
	else:
		print("WARNING! Invalid key to save score")

func get_current_world(): return save_data["current_world"]
func set_current_world(value): save_data["current_world"] = value


func save():
	savegame.open(save_path, File.WRITE) #open file to write
	savegame.store_var(save_data) #store the data
	savegame.close() # close the file
