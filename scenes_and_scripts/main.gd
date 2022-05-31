extends Container

var _menu = preload("screen__main_menu/main_menu.tscn")

func _ready():
	ScreenManager.goto_scene(_menu)
