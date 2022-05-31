extends CanvasLayer

func _ready():
	##UNCOMMENT LINE BELOW AND COMMENT OTHER DECLARATION OF last_open_background_path IF MOVED BACKGROUNDS FILES/FOLDERS. RUN ONCE THE UNDO
	###var last_open_background_path = "res://scenes_and_scripts/background__matrix/matrix_background.tscn"
	
	#Load the background from last time you open the App and make it the current background
	var last_open_background_path: String
	var user_conf_bk_path_validated : bool = false
	for ii in GlobalConstants.POSIBLE_BACKGROUNDS:
		print(UserConfig.selected_background)
		if (ii.path == UserConfig.selected_background["path"]):
			user_conf_bk_path_validated = true
	if (user_conf_bk_path_validated == false):
		last_open_background_path = GlobalConstants.DEFAULT_BACKGROUND
	else:
		 last_open_background_path = UserConfig.selected_background["path"];
	var last_open_background_scene = load(last_open_background_path)
	var background_container_node = get_node("/root/Main/BackgroundContainer")
	BackgroundManager.goto_scene(last_open_background_scene, background_container_node)
