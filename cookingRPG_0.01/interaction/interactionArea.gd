extends Area2D

@export var interacter:Node2D #Tipo do objeto interagidor, no caso o player, que eh Characterbody2D, mas colocou node, pois pode ser usado para outras coisas
@export var interaction_shortcut:StringName = "interact" #atalho para o mapa de entrada. Podemos usar isso para as configurações do jogo no futuro?

@onready var inventory_ui = $"../../inventory_ui"
 
var object_interacted:Interactable #objeto que estamos interagindo no momneto
var vector_areas : Array[Interactable]

# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event: InputEvent):
	#print_debug("B")
	if event.is_action_pressed(interaction_shortcut):
		#print_debug("A")
		if object_interacted != null:
			object_interacted.interaction(interacter)
	elif event.is_action_pressed("ui_inventory"):
		#print_debug("aqui")
		inventory_ui.visible = !inventory_ui.visible
		get_tree().paused = !get_tree().paused

func _on_area_entered(area : Area2D):
	if(area is Interactable):
		vector_areas.push_back(area)
		
		if object_interacted == null:
			object_interacted = vector_areas[0]

func _on_area_exited(area : Area2D):
	if(area is Interactable):
		vector_areas.erase(area)
		
		object_interacted.stop_interating(interacter)
		object_interacted = null
		
		if(vector_areas.size() > 0):
			object_interacted = vector_areas[0]
