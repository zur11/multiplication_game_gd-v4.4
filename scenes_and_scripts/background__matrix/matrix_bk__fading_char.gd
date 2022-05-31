extends Control

var char_font 
var char_color = Color(0,0,255,1)
var posible_chars_to_print = ["x"]
var y_position = 0
var x_position = 0

func init(posi_chars:Array, initial_y:int, x_pos:int, font):
	char_font = font
	posible_chars_to_print = posi_chars
	y_position = initial_y 
	x_position = x_pos 

func _ready():
	self.set_position(Vector2(x_position,y_position))
	$Label.text = posible_chars_to_print[randi()%posible_chars_to_print.size()]
	
# warning-ignore:return_value_discarded
	$AutoDeleteTimer.connect("timeout",self,"auto_delete")

func auto_delete():
	self.queue_free()
