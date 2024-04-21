class_name armario extends Interactable

@export var aberto:bool = false

@export var scene_to_load:PackedScene

func interaction(user:Node2D):
	aberto = not aberto
	print_debug(("armario: funcionou!!!!"))
	if aberto:
		#get_tree().change_scene_to_packed(scene_to_load)
		print_debug("teste")
	#else: Osso eh feito na outra cena, ja que nessa isso não vai funcionar
	#	get_tree().change_scene_to_packed(back_scene)
	
func stop_interating(user:Node2D):
	aberto = false
	print_debug("armario: parou de interagir corretamente")	
