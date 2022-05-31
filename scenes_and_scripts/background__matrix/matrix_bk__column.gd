extends Control

var fadingChar = preload("matrix_bk__fading_char.tscn")

var x_position := 0
var y_positions := [20,80,140,200,260,320,380]
var posibles_chars:Array
var time_between_chars: float
var chars_font: Resource
const FRAME_PER_SECOND = 60
var frames_between_chars: int = time_between_chars * FRAME_PER_SECOND
var position_index = 0

func init(y_pos_array:Array, x_pos:int, chars_fnt:Resource, pos_chars:Array, time_betw_chars:= 1.0):
	chars_font = chars_fnt
	time_between_chars = time_betw_chars
	frames_between_chars = int(time_between_chars * FRAME_PER_SECOND)
	posibles_chars = pos_chars
	x_position = x_pos
	y_positions = y_pos_array
	
func _ready():
	pass
	
func _physics_process(_delta):
	if frames_between_chars > 0:
		frames_between_chars -= 1
	else:
		var new_label = fadingChar.instance()
		new_label.init(posibles_chars, y_positions[position_index], x_position, chars_font)
		add_child(new_label)
		
		
		if position_index < y_positions.size() - 1:
			position_index += 1
		else:
			position_index = 0
		frames_between_chars = int(time_between_chars * FRAME_PER_SECOND)
	
