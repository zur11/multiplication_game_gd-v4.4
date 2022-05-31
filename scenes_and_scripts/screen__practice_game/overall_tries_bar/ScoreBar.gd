extends ProgressBar

var _correct_tries:=0
var _total_tries:=0

# warning-ignore:return_value_discarded
func _ready(): Signals.connect("last_tries", self, "last_tries_calc")

func last_tries_calc(last_try) -> void:

	_total_tries += 1
	
	if last_try:
		_correct_tries += 1
	
	self.value = float(_correct_tries) / float(_total_tries) * 100
