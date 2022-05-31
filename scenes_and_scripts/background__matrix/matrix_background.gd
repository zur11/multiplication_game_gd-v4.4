extends Control

var _matrix_column = preload("matrix_bk__column.tscn")
var _matrix_font = preload("res://assets/themes/fonts/default_dynamicfont_bluetheme.tres")
var matrix_color = Color(0,255,0,1)

var posibles_chars:Array = ["0", "1"] setget set_chars_to_display

var _x_positions = []
var _y_positions = []

var columns_not_in_screen = []

var rng = RandomNumberGenerator.new()

func _ready():
	calculate_font_positions()
	create_every_column_and_positionate_it()
	columns_to_scene_with_random_time()

#Calculates the POSITIONS OF THE CHARS based on FONT WIDTH and SCREEN WIDTH
func calculate_font_positions() -> void:
	#CALCULATE X(COLUMN) FONT POSITION
	var font_width = 0
	for ii in posibles_chars.size():
		if _matrix_font.get_char_size(ord(posibles_chars[ii]))[0] > font_width:
			font_width = _matrix_font.get_char_size(ord(posibles_chars[ii]))[0]
	var screen_width = get_viewport().size.x
	var letters_x_quantity = ceil(screen_width / font_width)
	for ii in letters_x_quantity:
		_x_positions.append(font_width * ii)
		
	#CALCULATE X(COLUMN) FONT POSITION
	var font_height = 0
	for ii in posibles_chars:
		if _matrix_font.get_char_size(ord(str(ii)))[1] > font_height:
			font_height = _matrix_font.get_char_size(ord(str(ii)))[1]
	var screen_heigth = get_viewport().size.y
	var letters_y_quantity = ceil(screen_heigth / font_height)
	for ii in letters_y_quantity:
		_y_positions.append(font_height * ii)

func create_every_column_and_positionate_it() -> void:
	var time_between_chars = $TimeBetweenColumnsTimer.wait_time
	for x_position in _x_positions:
		var new_matrix_column = _matrix_column.instance()
		new_matrix_column.init(_y_positions, x_position, _matrix_font, posibles_chars,time_between_chars)
		columns_not_in_screen.append(new_matrix_column)

func columns_to_scene_with_random_time() -> void:
	var _err = $TimeBetweenColumnsTimer.connect("timeout",self,"put_column_to_scene_tree")

func put_column_to_scene_tree() -> void:
	if columns_not_in_screen.size() > 0:
		var column_to_add_to_screen_index = rng.randi_range(0, columns_not_in_screen.size() - 1)
		var column_to_add_to_screen = columns_not_in_screen[column_to_add_to_screen_index]
		$MatrixContainer.add_child(column_to_add_to_screen)

		columns_not_in_screen.remove(column_to_add_to_screen_index)
	else:
		$TimeBetweenColumnsTimer.stop()

func set_chars_to_display(pos_chars:Array) -> void:
	posibles_chars = pos_chars
