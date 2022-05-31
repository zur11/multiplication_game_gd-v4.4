extends MarginContainer

export var size:int
onready var _last_tries_array := [] 
onready var _last_tries_nodes_array :=[]

# warning-ignore:return_value_discarded
func _ready(): 
	Signals.connect("last_tries", self, "last_tries_calc")
	for ii in size:
		var newColorRect = ColorRect.new()
		newColorRect.color = ColorN("gray", 1)
		newColorRect.rect_min_size = Vector2(10,20)
		_last_tries_nodes_array.push_front(newColorRect)
		$HBoxContainer.add_child(newColorRect)



func last_tries_calc(last_try) -> void:

	_last_tries_array.push_front(int(last_try))
	
	if _last_tries_array.size() > size:
		_last_tries_array.pop_back()

	for ii in _last_tries_array.size():
		if _last_tries_array[ii] == 1:
			_last_tries_nodes_array[ii].color = ColorN("green",1)
		elif _last_tries_array[ii] == 0:
			_last_tries_nodes_array[ii].color = ColorN("red",1)
		
	var _correct_tries = float(_last_tries_array.count(1))
	$Last20TtriesBar.value = _correct_tries / float(_last_tries_array.size()) * 100

