extends OptionButton

var _posible_backgrounds_packed_scene_array = []
var _loading_thread

func _ready():
	_loading_thread = Thread.new()
	_loading_thread.start(self, "_loading_thread_func")
	for ii in GlobalConstants.POSIBLE_BACKGROUNDS.size():
		#create items based on posible backgrounds declared in Global Values
		self.add_item(GlobalConstants.POSIBLE_BACKGROUNDS[ii]["name"] + " Background",ii)
		#_posible_backgrounds_packed_scene_array.append(load(GlobalConstants.POSIBLE_BACKGROUNDS[ii]["path"]))
		#Select the current selected background on the button 
		if GlobalConstants.POSIBLE_BACKGROUNDS[ii].hash() == UserConfig.selected_background.hash():
			self.select(ii)

func _loading_thread_func() -> void:
	self.set_disabled(true)
	_load_backgrounds_scenes()
	self.set_disabled(false)
	
func _load_backgrounds_scenes(): 
	#load the posible background SCENES to MEMORY. So when added to scene_tree doesn't take long	
	for ii in GlobalConstants.POSIBLE_BACKGROUNDS.size():
		_posible_backgrounds_packed_scene_array.append(load(GlobalConstants.POSIBLE_BACKGROUNDS[ii]["path"]))
	return
	
func _on_BakcgroundSelectButton_item_selected(index):
	BackgroundManager.goto_scene(_posible_backgrounds_packed_scene_array[index], get_node("/root/Main/BackgroundContainer"))
	UserConfig.selected_background = GlobalConstants.POSIBLE_BACKGROUNDS[index]

func _exit_tree():
	_loading_thread.wait_to_finish()
	pass
