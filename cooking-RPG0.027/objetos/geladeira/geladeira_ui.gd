extends Control

signal botao_pressionado_ui

func _on_geladeira_slot_1_botao_pressionado(item_geladeira:inventoryItem):
	print_debug("B")
	botao_pressionado_ui.emit(item_geladeira)
