extends AudioStreamPlayer

onready var _audio_fx__correct = preload("res://scenes_and_scripts/screen__practice_game/soundEffects/correct.mp3")
onready var _audio_fx__wrong = preload("res://scenes_and_scripts/screen__practice_game/soundEffects/error.mp3")

# warning-ignore:return_value_discarded
func _ready(): Signals.connect("last_tries", self, "last_tries_calc")

func last_tries_calc(last_try) -> void:
	if last_try:
		self.stream = _audio_fx__correct
	else:
		self.stream = _audio_fx__wrong
	self.play()

