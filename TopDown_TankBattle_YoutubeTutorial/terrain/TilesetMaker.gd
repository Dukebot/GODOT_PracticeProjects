extends Node

var tile_size = Vector2(128, 128)

onready var texture = $Sprite.texture

func _ready():
	var texture_width = texture.get_width() / tile_size.x
	var texture_height = texture.get_height() / tile_size.y
	var tile_set = TileSet.new()
	
	for x in range(texture_width):
		for y in range(texture_height):
			var region = Rect2(
				x * tile_size.x, 
				y * tile_size.y,
				tile_size.x, 
				tile_size.y
			)
			var id = x + y * 10;
			
			tile_set.create_tile(id)
			tile_set.tile_set_texture(id, texture)
			tile_set.tile_set_region(id, region)
	
	ResourceSaver.save("res://terrain/terrain_tiles.tres", tile_set)
