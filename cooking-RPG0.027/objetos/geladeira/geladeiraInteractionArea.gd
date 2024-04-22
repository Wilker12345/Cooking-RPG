extends Interactable

@export var aberto:bool = false

func interaction(user:Node2D):
	aberto = not aberto
	print_debug(("geladeira: funcionou!!!!"))
	
func stop_interating(user:Node2D):
	aberto = false
	print_debug("geladeira: parou de interagir corretamente")
	
	
