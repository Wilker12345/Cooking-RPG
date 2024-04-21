extends Resource

class_name player_inventario

@export var itens: Array[inventoryItem]

func addItem(item:inventoryItem):
	var item_adicionado:bool = false
	for i in itens.size():
		if itens[i] == null:
			item_adicionado = true
			itens[i] = item
	
	if !item_adicionado:
		print("Inventário_cheio")
			
