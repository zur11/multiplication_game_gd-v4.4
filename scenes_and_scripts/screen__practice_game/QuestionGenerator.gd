class_name QuestionGenerator extends Node

var answers_array:Array = _create_posible_answers()

func create_question():
	randomize()
	var questionNum1 = randi()%11
	var questionNum2 = randi()%11
	var correct_option_value = questionNum1 * questionNum2
	return [questionNum1, questionNum2, correct_option_value]

func create_options(correct_option_value):

	var correct_option_index = randi()%4
	var options = [0,0,0,0]
	
	options[correct_option_index] = correct_option_value

	for option_index in options.size():
		var is_the_correct_option = true if (option_index == correct_option_index) else false 
		
		var new_option_index_in_answers_array = randi()%answers_array.size()
		var new_option_value = answers_array[new_option_index_in_answers_array]

		while options.has(new_option_value):
			new_option_value = randi()%answers_array.size()
		
		if !is_the_correct_option:
			options[option_index] = new_option_value
	
	return options


func _create_posible_answers():
	var answer_array_inner = []
	for ii in range(11):
		for jj in range(ii, 11):
			if !answer_array_inner.has(ii*jj):
				answer_array_inner.append(ii*jj)
	return answer_array_inner
