extends CanvasLayer

onready var transition_rect : ColorRect = ColorRect.new()

func _ready() -> void:
	var full_screen : Vector2 = Vector2(360,640)
	var transparentColor = Color("00000000")
	
	transition_rect.rect_size = full_screen
	transition_rect.color = transparentColor
	
	add_child(transition_rect)

func change_scene_with_animation(scene : PackedScene, container:Node = get_node("/root/Main/MainContainer"))-> void:
	var transitionColor = Color("000000")
	#fade in
	yield(ObjectAnimationRepository.fade_in(transition_rect, 0.5, transitionColor), "completed")
	#change scene
	if container:
		ScreenManager.goto_scene(scene, container)
	else:
		ScreenManager.goto_scene(scene)
	#fade out
	yield(ObjectAnimationRepository.fade_out(transition_rect, 0.5, transitionColor), "completed")
