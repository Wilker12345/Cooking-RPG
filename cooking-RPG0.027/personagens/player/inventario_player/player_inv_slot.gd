extends Panel

@onready var backgroundSprite:Sprite2D = $background
@onready var itemSprite:Sprite2D = $item
var item_geral:inventoryItem = null

func update(item : inventoryItem):
	if !item:
		#backgroundSprite.frame = 0
		itemSprite.visible = false
		item_geral = null
	else:
		print_debug("dentro do update ui")
		#backgroundSprite.frame = 1
		itemSprite.visible = true
		itemSprite.texture = item.texture
		item_geral = item

func _on_use_pressed():
		print_debug("aqui fora")
		if item_geral:
			print_debug("player_inv: FOI!!!")
		else:
			print_debug("player_inv: não tem item para interageir")
