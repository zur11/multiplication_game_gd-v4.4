extends MarginContainer

var _game_scene = load(GlobalConstants.SCENES_AND_SCRIPTS_PATHS["scene__game"])
var _config_menu_scene = load(GlobalConstants.SCENES_AND_SCRIPTS_PATHS["scene__config_menu"])
var _login_scene = load(GlobalConstants.SCENES_AND_SCRIPTS_PATHS["scene__login"])

func _ready():
	var _err1 = get_node("CenterContainer/VBoxContainer/GoToGameBtn").connect("pressed",self,"goto_scene",[_game_scene])
	var _err2 = get_node("CenterContainer/VBoxContainer/GoToSettingsBtn").connect("pressed",self,"goto_scene",[_config_menu_scene])
	var _err3 = get_node("CenterContainer/VBoxContainer/GoToLoginBtn").connect("pressed",self,"goto_scene",[_login_scene])

func goto_scene(scene):
	AnimatedSceneManager.change_scene_with_animation(scene)
