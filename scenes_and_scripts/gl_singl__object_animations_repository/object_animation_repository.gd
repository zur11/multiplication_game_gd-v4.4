extends Node

const TRANSPARENT_COLOR  = Color("00000000")
onready var transition_tween : Tween = Tween.new()

func _ready() -> void:
	add_child(transition_tween)

func fade_in_out(obj:Node, duration:float, startColor:Color):
	yield(fade_in(obj, duration/2, startColor), "completed")
	yield(fade_out(obj, duration/2, startColor), "completed")
	
func fade_in(obj:Node, duration:float, startColor:Color, endColor:Color = TRANSPARENT_COLOR) -> void:
	var _fadeIn = transition_tween.interpolate_property(obj, 
										"color", endColor,
										startColor, duration)
	var _fadeInStart = transition_tween.start()
	yield(transition_tween, "tween_completed")

func fade_out(obj:Node, duration:float, startColor:Color, endColor:Color = TRANSPARENT_COLOR) -> void:
	var _fadeOut = transition_tween.interpolate_property(obj, 
										"color", startColor,
										endColor, duration)
	var _fadeOutStart = transition_tween.start()
	yield(transition_tween, "tween_completed")

