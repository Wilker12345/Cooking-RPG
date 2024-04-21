extends Panel

@onready var backgroundSprite:Sprite2D = $background
@onready var itemSprite:Sprite2D = $item
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


func _on_button_pressed():
	if item_geladeira:
		
		print_debug("geladeira_inv: FOI!!!")
	else:
		print_debug("geladeira_inv: não tem item para interageir")
