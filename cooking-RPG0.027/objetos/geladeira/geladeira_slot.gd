extends Panel

@onready var backgroundSprite:Sprite2D = $background
@onready var itemSprite:Sprite2D = $item

@onready var player_scene = preload("res://personagens/player/player.tscn")

#@export var inventario_player:
#@onready var player_inventario_script = preload("res://personagens/player/inventario_player/player_inventario.gd")
var item_geladeira:inventoryItem = null


func update(item : inventoryItem):
	if !item:
		backgroundSprite.frame = 0
		itemSprite.visible = false
		item_geladeira = null
	else:
		backgroundSprite.frame = 1
		itemSprite.visible = true
		itemSprite.texture = item.texture
		item_geladeira = item

#func retorna_item() -> inventoryItem:
	#return item_geladeira

func _on_button_pressed():
	if item_geladeira:
		var player_instance = player_scene.instantiate()
		var player_node = player_instance.get_node(".")
		player_node.addItem(item_geladeira)
		print_debug("geladeira_inv: FOI!!!")
	else:
		print_debug("geladeira_inv: não tem item para interageir")
