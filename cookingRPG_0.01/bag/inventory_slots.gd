extends Control

@onready var icon = $innerBorder/itemIcon
@onready var quantity_label = $innerBorder/itemQuantity
#@onready var details_panel = 
#@onready var item_name = 
#@onready var item_type = 
#@onready var item_effect = 
@onready var usage_panel = $usagePanel

#item do slot no inventario
var item = null

#
func _on_item_button_pressed():
	if item != null:
		usage_panel.visible = !usage_panel.visible

#
func _on_item_button_mouse_entered():
	if item != null:
		usage_panel.visible = false
		#details_panel.visible = true

#
#func _on_item_button_mouse_exited():
	#details_panel.visible = true


#
func set_empty():
	#print_debug("E")
	icon.texture = null
	quantity_label.text = ""
	
func set_item(new_item):
	#print_debug("D")
	item = new_item
	icon.texture = new_item["texture"]
	quantity_label.text = str(item["quantity"])
	#item_name.text = str(item["name"])
	#item_type.text = str(item["type"])
	#if item["effect"] != "":
		#item_effect.text = str("* ", item["effect"])
	#else:
		#item_effect.text = ""
	
