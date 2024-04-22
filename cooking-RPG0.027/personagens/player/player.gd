extends CharacterBody2D

@export var speed:int = 100
@export var player_inventory:player_inventario

@onready var slots:Array = $CanvasLayer/player_inv_ui/NinePatchRect/GridContainer.get_children(false)
@onready var animation = $AnimationPlayer

func _ready():
	update()

func addItem(item:inventoryItem):
	print_debug(slots.size(), " ",player_inventory.itens.size())
	var item_adicionado:bool = false
	for i in range(player_inventory.itens.size()):
		if !player_inventory.itens[i]:
			item_adicionado = true
			player_inventory.itens[i] = item
			var aux:inventoryItem = player_inventory.itens[i]
			print_debug("A")
			break
	if !item_adicionado:
		print("Inventário_cheio")
	print_debug(slots.size(), " ",player_inventory.itens.size())
	#update() #função com problema
	print_debug("B")

#update itera por todos os nos ou slots do inventario da geladeira (usando o menor deles, para inpedir erros). Depois disso para cada nó criado
#no GridContainer, chamamos a função update (que fica no "geladeira_slot"), essa função vai atualizar os sprites do vetor, mostrando para
#o jogoador o rseultado final
func update():
	print_debug("C")
	print_debug(slots.size(), " ",player_inventory.itens.size())
	for i in range(player_inventory.itens.size()):
		slots[i].update(player_inventory.itens[i])
	print_debug(slots.size(), " ",player_inventory.itens.size())
	

func getInput():
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed

func chooseAnimation():
	if velocity.length() == 0:
		if animation and animation.is_playing():
			animation.stop()
	else:
		var anim:String = "Down"
		if velocity.x < 0: anim = "Left"
		elif velocity.x > 0: anim = "Rigth"
		elif velocity.y < 0: anim = "Up"
		animation.play("move" + anim)

func _process(delta):
	getInput()
	chooseAnimation()
	move_and_slide()
	
#não usado no momento
#func _input(event):
	#if event.is_action_pressed("ui_inventory"):
		#print_debug("aqui")
		#inventory_ui.visible = !inventory_ui.visible
		#get_tree().paused = !get_tree().paused
		
