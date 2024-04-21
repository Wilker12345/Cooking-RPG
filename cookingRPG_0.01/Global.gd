extends Node

#ote que a variavel "invetory" eh inicializada com "null" em todos os indices
var inventory = []
#sinal que mostrara quanda algo aconteceu com o invetario, exemplo: adicionar item, remover ou aumentar tamanho inventario
signal inventory_update
#referencia para node e cena "player"
var player_node:Node = null
@onready var inventory_slot_scene = preload("res://bag/inventory_slots.tscn")

func _ready():
	inventory.resize(10)

func addItem(item):
	for i in range(inventory.size()): #passa pelo vetor inventario
		if inventory[i] != null and inventory[i]["type"] == item["type"] and inventory[i]["effect"] == item["effect"]: #verifica se o "slot" tem algo, se tiver verifica se o tipo e o efeito do item do inventario eh igual ao do item a ser inserido
			inventory[i]["quantity"] += item["quantity"] #se forem iguais (sao o mesmo item) logo podemos estacar eles (nao tem limite de quantidade aparentemente)
			inventory_update.emit()
			print("Item adicionado ao inventario")
			return true #retorna true se conseugiu atualizar o inventario
		elif inventory[i] == null: #se slot estiver vazio
			inventory[i] = item #insere o item no slot
			inventory_update.emit()
			print("Item adicionado ao inventario")
			return true
		return false #caso todos os slots estejam cheios, retorna false

func removeItem():
	inventory_update.emit()
	
func increase_inventory_size():
	inventory_update.emit()
	
func set_player_reference(player):
	player_node = player

