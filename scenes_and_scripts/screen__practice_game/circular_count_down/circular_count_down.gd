extends Control

signal time_out

var _timer:Timer = null
var _circular_progress_bar:CircularProgressBar = null

var _minimal_step:float = 0.05
onready var total_time:float = 5
onready var elapsed_time:float = 0
onready var remaining_time:float = total_time - elapsed_time

func _ready() -> void:
	_timer = $Timer
	_timer.wait_time = _minimal_step
	_circular_progress_bar = $CircularProgressBar
	_circular_progress_bar.max_value = total_time
	var _err = _timer.connect("timeout", self, "_change_elapsed_time")
	_timer.start()
	
func _change_elapsed_time() -> void:
	if elapsed_time < total_time - _minimal_step:
		elapsed_time = elapsed_time + _minimal_step
	else:
		elapsed_time = 0
		emit_signal("time_out")
	remaining_time = total_time - elapsed_time
	_circular_progress_bar.value = range_lerp(remaining_time, 0, total_time, 0, 100)

func restart_timer() -> void:
	elapsed_time = 0
