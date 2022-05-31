extends Node2D

var answer_array:Array = create_posible_answers()

const SCENES_AND_SCRIPTS_PATHS: Dictionary = {
	"scene__main_menu": "res://scenes_and_scripts/screen__main_menu/main_menu.tscn",
	"scene__config_menu":"res://scenes_and_scripts/screen__config_menu/config_menu.tscn",
	"scene__game":"res://scenes_and_scripts/screen__practice_game/game.tscn",
	"scene__login":"res://scenes_and_scripts/screen__login/login.tscn",
	"scene__register": "res://scenes_and_scripts/screen__register/register.tscn",
	"scene__parallax_background": "res://scenes_and_scripts/background__math_parallax/math_parallax_background.tscn",
	"scene__matrix_background": "res://scenes_and_scripts/background__matrix/matrix_background.tscn",
	"scene__foggy_mountain": "res://scenes_and_scripts/background__foggy_mountain/foggy_background.tscn"
}
const ASSETS_PATHS: Dictionary = {
	"background_music": "res://global_assets/music/music_zapsplat_action_break.mp3"
}
#var MATRIX_BACKGROUND = ["Matrix", SCENES_AND_SCRIPTS_PATHS["scene__matrix_background"]]
#var PARALLAX_BACKGROUND = ["Parallax", SCENES_AND_SCRIPTS_PATHS["scene__parallax_background"]]
#var FOGGY_BACKGROUND = ["Foggy", SCENES_AND_SCRIPTS_PATHS["scene__foggy_mountain"]]
var MATRIX_BACKGROUND = {"name":"Matrix","path": SCENES_AND_SCRIPTS_PATHS["scene__matrix_background"]}
var PARALLAX_BACKGROUND = {"name":"Parallax", "path": SCENES_AND_SCRIPTS_PATHS["scene__parallax_background"]}
var FOGGY_BACKGROUND = {"name":"Foggy", "path": SCENES_AND_SCRIPTS_PATHS["scene__foggy_mountain"]}
var DEFAULT_BACKGROUND = PARALLAX_BACKGROUND
var POSIBLE_BACKGROUNDS = [
	MATRIX_BACKGROUND, 
	PARALLAX_BACKGROUND,
	FOGGY_BACKGROUND
	]
func create_posible_answers():
	var answer_array_inner = []
	for ii in range(11):
		for jj in range(ii, 11):
			if !answer_array_inner.has(ii*jj):
				answer_array_inner.append(ii*jj)
	return answer_array_inner
