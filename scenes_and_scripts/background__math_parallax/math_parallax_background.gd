extends ParallaxBackground

onready var fondo = get_node("ParallaxLayer")
onready var fondo2 = get_node("ParallaxLayer2")

func _physics_process(_delta):
	fondo.motion_offset.x += -.1
	fondo2.motion_offset.x += -.08
