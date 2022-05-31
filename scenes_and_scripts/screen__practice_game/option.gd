extends TextureButton

signal answer_selected(valor)

var miValor:int

func _ready():
	
	self.set_size(Vector2(49, 57))
	# warning-ignore:return_value_discarded
	self.connect("pressed", self, "enviarMiValor")

func enviarMiValor():
	emit_signal("answer_selected", miValor)


func set_new_question(miValorIn: int):
	miValor = miValorIn
	$Label.text = str(miValor)
