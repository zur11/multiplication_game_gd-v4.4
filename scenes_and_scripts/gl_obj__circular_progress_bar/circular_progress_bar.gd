extends Control

class_name CircularProgressBar

export(int) var value setget set_value
export(int) var min_value = 0 
export(int) var max_value = 100 

signal value_changed

var texture_progress:TextureProgress = null
var label:Label = null

func _ready():
	texture_progress = $TextureProgress
	label = $Label
	set_value(30)
	pass

func set_value(new_value):
	value = new_value
	emit_signal("value_changed", value)
	var lerped_value = range_lerp(value, 0, 100, min_value, max_value)
	if (texture_progress and label):
		var g = range_lerp(value, 0, 100, 0, 1)
		var r = range_lerp(value, 0, 100, 1, 0)
		texture_progress.tint_progress = Color(r, g, 0)
		texture_progress.value = value
		label.text = str(ceil(lerped_value))
