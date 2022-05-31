extends Node

onready var _user_config_file = File.new()
onready var _user_config_file_path = "user://config.save"

onready var selected_background = _read_selected_background_from_file() setget selected_background_set

func selected_background_set(new_value):
	_write_selected_background_to_file(new_value)
	selected_background = new_value
	
func _write_selected_background_to_file(selected_background_to_write):
	_user_config_file.open(_user_config_file_path, File.WRITE)
	_user_config_file.store_var(selected_background_to_write)
	_user_config_file.close()

func _read_selected_background_from_file():
	var return_value
	if  _user_config_file.file_exists(_user_config_file_path):
		_user_config_file.open(_user_config_file_path, File.READ)
		return_value = _user_config_file.get_var()
		_user_config_file.close()
		printt('si hay archivo return', return_value)
	else:
		print('no hay archivo')
		return_value = GlobalConstants.DEFAULT_BACKGROUND
	return return_value
