extends Node2D
@onready var geladeira_interaction_area = $geladeiraInteractionArea
@onready var geladeira_ui = $CanvasLayer/geladeira_ui
@onready var inventario_geladeira_scene = preload("res://objetos/geladeira/invetario_geladeira.tres")

#funcao get_children pega todos os nós que são filhos de um nó (no caso, GridContainer)
@onready var slots:Array = $CanvasLayer/geladeira_ui/NinePatchRect/GridContainer.get_children(false)

#so podemos criar essa variavel do tipo geladeira_inventario por que existe uma classe com esse nome (class_name geladeira_inventario)
@export var geladeira_inventory:geladeira_inventario

#Called when the node enters the scene tree for the first time.
func _ready():
	update()
	
#update itera por todos os nos ou slots do inventario da geladeira (usando o menor deles, para inpedir erros). Depois disso para cada nó criado
#no GridContainer, chamamos a função update (que fica no "geladeira_slot"), essa função vai atualizar os sprites do vetor, mostrando para
#o jogoador o rseultado final
func update():
	for i in range(min(geladeira_inventory.itens.size(), slots.size())):
		slots[i].update(geladeira_inventory.itens[i])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if geladeira_interaction_area.aberto:
		geladeira_ui.visible = !geladeira_ui.visible
		geladeira_interaction_area.aberto = false
		get_tree().paused = !get_tree().paused
