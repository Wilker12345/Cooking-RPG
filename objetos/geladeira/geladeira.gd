extends Node2D
@onready var geladeira_interaction_area = $geladeiraInteractionArea
@onready var geladeira_ui = $geladeira_ui

var geladeira_inventory = []
signal geladeira_inventory_update

# Called when the node enters the scene tree for the first time.
func _ready():
	geladeira_inventory.resize(9)

func add_item_geladeira(item):
	for i in range(geladeira_inventory.size()): #passa pelo vetor geladeira_inventory
		if geladeira_inventory[i] != null and geladeira_inventory[i]["type"] == item["type"] and geladeira_inventory[i]["effect"] == item["effect"]: #verifica se o "slot" tem algo, se tiver verifica se o tipo e o efeito do item do inventario eh igual ao do item a ser inserido
			geladeira_inventory[i]["quantity"] += item["quantity"] #se forem iguais (sao o mesmo item) logo podemos estacar eles (nao tem limite de quantidade aparentemente)
			print("Item adicionado ao inventario")
			return true #retorna true se conseugiu atualizar o inventario
		elif geladeira_inventory[i] == null: #se slot estiver vazio
			geladeira_inventory[i] = item #insere o item no slot
			print("Item adicionado ao inventario")
			return true
		return false #caso todos os slots estejam cheios, retorna false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if geladeira_interaction_area.aberto:
		geladeira_ui.visible = !geladeira_ui.visible
		geladeira_interaction_area.aberto = false
		get_tree().paused = !get_tree().paused
