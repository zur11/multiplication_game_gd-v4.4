extends ColorRect

func _ready():
	var transparentColor = Color("00000000")
	self.color = transparentColor
# warning-ignore:return_value_discarded
	Signals.connect("last_tries", self, "animateAnswer")
	
func animateAnswer(is_correct:bool):
	var WrongAnswerColor = Color("77fb0505")
	
	match is_correct:
		true:
			pass
		false:
			return ObjectAnimationRepository.fade_in_out(self,.4, WrongAnswerColor)

