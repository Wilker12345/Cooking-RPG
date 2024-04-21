extends Control

@onready var grid_container = $GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.inventory_update.connect(_on_inventory_update)
	_on_inventory_update()


func _on_inventory_update():
	print_debug("A'''")
	#limpa os itens existentes do inventario
	clear_grid_container()
	for item in Global.inventory:
		#print_debug("B")
		var slot = Global.inventory_slot_scene.instantiate()
		grid_container.add_child(slot) 
		if item != null:
			slot.set_item(item)
		else:
			slot.set_empty()
		#print_debug("C")

func clear_grid_container():
	while grid_container.get_child_count() > 0:
		var child = grid_container.get_child(0)
		grid_container.remove_child(child)
		child.queue_free()

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
