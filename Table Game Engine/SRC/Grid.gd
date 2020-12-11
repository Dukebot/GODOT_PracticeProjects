extends Node2D

const view_width := 1280.0
const view_heigh := 720.0

const colors_map := {
	"black": "#000000",
	"white": "#ffffff",
	"blue": "#0a49ad",
	"red": "#ad1d0a",
	"yellow": "#e0de46",
	"green": "#189618",
	"orange": "#c9981c",
	"purple": "#c9981c",
	"brown": "#302415",
	"grey": "#404042"
}

const colors_array := [
	"#000000",
	#"#ffffff",
	"#0a49ad",
	"#ad1d0a",
	"#e0de46",
	"#189618",
	"#c9981c",
	"#c9981c",
	"#302415",
	"#404042"
]

const Square := preload("res://SRC/Square.tscn")

export var num_rows := 10
export var num_cols := 10

export var square_size := 40.0
export var margin_between_squares := 1.0

onready var grid_width := num_cols * square_size + num_cols * margin_between_squares
onready var grid_height := num_rows * square_size + num_rows * margin_between_squares
onready var initial_pos_grid_centered_x := (view_width - grid_width)/2
onready var initial_pos_grid_centered_y := (view_heigh - grid_height)/2

onready var grid = create_matrix(num_cols, num_rows)


#Public

func click(pos: Vector2):
	if in_table(pos):
		var grid_pos := convert_to_grid_pos(pos)
		var i = int(grid_pos.x / (square_size + margin_between_squares))
		var j = int(grid_pos.y / (square_size + margin_between_squares))
		print("Clicked at " + str(i) + " " + str(j))
		
		#Check for contiguous white spot
		
		#White at right?
		if i+1 < num_cols and grid[i+1][j].get_color() == Color(colors_map["white"]):
			grid[i+1][j].set_color(grid[i][j].get_color())
			grid[i][j].set_color(Color(colors_map["white"]))
		#White at left?
		if i-1 >= 0 and grid[i-1][j].get_color() == Color(colors_map["white"]):
			grid[i-1][j].set_color(grid[i][j].get_color())
			grid[i][j].set_color(Color(colors_map["white"]))
		#White at bottom?
		if j+1 < num_rows and grid[i][j+1].get_color() == Color(colors_map["white"]):
			grid[i][j+1].set_color(grid[i][j].get_color())
			grid[i][j].set_color(Color(colors_map["white"]))
		#White at top?
		if j-1 >= 0 and grid[i][j-1].get_color() == Color(colors_map["white"]):
			grid[i][j-1].set_color(grid[i][j].get_color())
			grid[i][j].set_color(Color(colors_map["white"]))

		
		#grid[i][j].set_color(colors_map["black"])
		update()


#Private

func _ready():
	#Initialize the grid data creating Square objects
	for i in num_cols:
		for j in num_rows:
			var square = Square.instance()
			add_child(square)
			grid[i][j] = square
			
			var pos = Vector2(
				initial_pos_grid_centered_x + i * square_size + i * margin_between_squares, 
				initial_pos_grid_centered_y + j * square_size + j * margin_between_squares
			)
			var color = get_random_color()
			grid[i][j].set_position(pos)
			grid[i][j].set_color(color)
			grid[i][j].set_size(square_size)
	
	#Set a random square of color white
	var rand_i: int = randi() % grid.size()
	var rand_j: int = randi() % grid[rand_i].size()
	var color = colors_map["white"]
	grid[rand_i][rand_j].set_color(color)


func _draw():
	for i in num_cols:
		for j in num_rows:
			draw_square(grid[i][j])


func get_random_color():
	var rand_index: int = randi() % colors_array.size()
	return Color(colors_array[rand_index])


func get_random_grid_item():
	var rand_i: int = randi() % grid.size()
	var rand_j: int = randi() % grid[rand_i].size()
	return grid[rand_i][rand_j]


func draw_square(square):
	var rect = Rect2(square.get_position(), Vector2(square.get_size(), square.get_size()))
	var filled = true
	var width = 1.0
	var antialiased = false
	draw_rect(rect, square.get_color(), filled, width, antialiased)
	

func in_table(pos: Vector2):
	if pos.x < initial_pos_grid_centered_x:
		return false
	if pos.x > initial_pos_grid_centered_x + grid_width:
		return false
	if pos.y < initial_pos_grid_centered_y:
		return false
	if pos.y > initial_pos_grid_centered_y + grid_height:
		return false
	return true


func convert_to_grid_pos(pos: Vector2) -> Vector2:
	pos.x -= initial_pos_grid_centered_x
	pos.y -= initial_pos_grid_centered_y
	return pos


func create_matrix(width, height):
	var matrix = []
	for x in range(width):
		matrix.append([])
		for y in range(height):
			matrix[x].append(0)
	return matrix
