extends Control

onready var _question_operation = $ExternalVBoxContainer/QuestionContainer/Question
onready var _question_timer = $ExternalVBoxContainer/HUDContainer/QuestionTimer
onready var _score_bar = $ExternalVBoxContainer/HUDContainer/VBoxContainer/ScoreBar
onready var _audio_effects_player = $ExternalVBoxContainer/GameSoundEffects
onready var _background_visual_effects = $GameAnimRect
onready var _audio_fx__correct = preload("res://scenes_and_scripts/screen__practice_game/soundEffects/correct.mp3")
onready var _audio_fx__wrong = preload("res://scenes_and_scripts/screen__practice_game/soundEffects/error.mp3")

onready var option_btn_array = [
	$ExternalVBoxContainer/Options/HBox/VBox1/op1,
	$ExternalVBoxContainer/Options/HBox/VBox1/op2,
	$ExternalVBoxContainer/Options/HBox/VBox2/op3,
	$ExternalVBoxContainer/Options/HBox/VBox2/op4
]

var tries = 0
var correct_tries = 0
var correct_porcentage = 0

var correct_option_value

var answers_array = GlobalConstants.create_posible_answers()

func _ready():
	var _err = _question_timer.connect("time_out", self, "evaluate_and_reset", [null])
	new_question()
	for option_btn in option_btn_array:
		option_btn.connect("answer_selected", self, "evaluate_and_reset")

func evaluate_and_reset(press_btn_value):

	var is_correct = true if (press_btn_value == correct_option_value) else false

	if is_correct:
		_audio_effects_player.stream = _audio_fx__correct
		correct_tries = correct_tries + 1
		AnswerSignals.emit_signal("last_tries", 1)
	else:
		_audio_effects_player.stream = _audio_fx__wrong
		_background_visual_effects.animateAnswer(false)
		AnswerSignals.emit_signal("last_tries", 0)
		
	_audio_effects_player.play()
	
	tries = tries + 1
	correct_porcentage = float(correct_tries) / float(tries) * 100
	_score_bar.value = correct_porcentage 

	new_question()
	_question_timer.restart_timer()

func new_question():
	randomize()
	var questionNum1 = randi()%11
	var questionNum2 = randi()%11
	correct_option_value = questionNum1 * questionNum2

	var correct_option_index = randi()%4
	var options = [0,0,0,0]
	
	options[correct_option_index] = correct_option_value

	for option_index in options.size():
		var is_the_correct_option = true if (option_index == correct_option_index) else false 
		
		var new_option_index_in_answer_array = randi()%answers_array.size()
		var new_option_value = answers_array[new_option_index_in_answer_array]

		while options.has(new_option_value):
			new_option_value = randi()%answers_array.size()
		
		if !is_the_correct_option:
			options[option_index] = new_option_value

	for ii in options.size():
		option_btn_array[ii].set_new_question(options[ii])
	
	_question_operation.text = str(questionNum1)+"X"+str(questionNum2)
