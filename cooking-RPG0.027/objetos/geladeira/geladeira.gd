extends Node2D
@onready var geladeira_interaction_area = $geladeiraInteractionArea
@onready var geladeira_ui = $CanvasLayer/geladeira_ui

#funcao get_children pega todos os nós que são filhos de um nó (no caso, GridContainer)
@onready var slots_2:Array = $CanvasLayer/geladeira_ui/NinePatchRect/GridContainer.get_children()

#so podemos criar essa variavel do tipo geladeira_inventario por que existe uma classe com esse nome (class_name geladeira_inventario)
@export var geladeira_inventory:geladeira_inventario
var player_scene = preload("res://personagens/player/player.tscn")
#Called when the node enters the scene tree for the first time.
func _ready():
	update()
	
#update itera por todos os nos ou slots do inventario da geladeira (usando o menor deles, para inpedir erros). Depois disso para cada nó criado
#no GridContainer, chamamos a função update (que fica no "geladeira_slot"), essa função vai atualizar os sprites do vetor, mostrando para
#o jogoador o rseultado final
func update():
	print_debug("slot_2: ", slots_2.size())
	for i in range(min(geladeira_inventory.itens.size(), slots_2.size())):
		slots_2[i].update(geladeira_inventory.itens[i])
	print_debug("slot_2: ", slots_2.size())
	

## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if geladeira_interaction_area.aberto:
		geladeira_ui.visible = !geladeira_ui.visible
		geladeira_interaction_area.aberto = false
		get_tree().paused = !get_tree().paused

func _on_geladeira_ui_botao_pressionado_ui(item_geladeira:inventoryItem):
	print_debug("A")
	var player_instance = player_scene.instantiate()
	var player_node = player_instance.get_node(".")
	var aux = player_node.slots.size()
	player_node.addItem(item_geladeira)
