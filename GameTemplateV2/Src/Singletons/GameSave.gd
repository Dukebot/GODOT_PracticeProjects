extends Node


const initial_save_data := {}

#Object to open, read, write and close files
var savegame = File.new() #file

#Path of the save file (Remember that this is the only writable path on Android)
var save_path := "user://gametemplate.save"

#Here we store the data of the save file
var save_data := {}


func init_save_data():
	if savegame.file_exists(save_path):
		savegame.open(save_path, File.READ)
		save_data = savegame.get_var()
		savegame.close()
	else:
		savegame.open(save_path, File.READ)
		save_data = initial_save_data.duplicate()
		savegame.store_var(save_data)
		savegame.close()


#Public

func save():
	savegame.open(save_path, File.WRITE) #open file to write
	savegame.store_var(save_data) #store the data
	savegame.close() # close the file
