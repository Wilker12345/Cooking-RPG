@tool
class_name inventory_item extends Node2D
#tipo do item. Consumivel, usável, equipavel, item de missão etc.
@export var item_type = ""
#nome do item, exemplo: maçã, ovo, pedra...
@export var item_name = ""
#textura do item
@export var item_texture: Texture
#o que esse item faz, o efeito dele no jogador. (não será usado agora, mas no futuro pode ser)
@export var item_effect = ""
#caminho para a cena dos itens do inventario. Sera usada para spawnar os itens no mundo (talvez não usemos tambem... agora)
var scene_path:String = "res://bag/inventory_slots.tscn"


#armazena qual o sprite inserido no item atual
@onready var icon_sprite = $Sprite2D
@onready var geladeira = preload("res://objetos/geladeira/geladeira.tscn").instantiate().get_node(".")

var player_in_range = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if not Engine.is_editor_hint(): #coloca a textura "in game" (enquanto roda o jogo)
		icon_sprite.texture = item_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.is_editor_hint(): #coloca a textura no editor (aqui)
		icon_sprite.texture = item_texture
	if player_in_range and Input.is_action_just_pressed("interact"): #note que o botao de pegar item eh o mesmo de interagir com a geladeira
		pickup_item()


func pickup_item():
	var item = { #cria um dicionario chamado "item" que tem estes seguintes atributos
		"quantity" : 1, #podemos mudar depois usando export e atribuindo uma outra variavel e nao um valor fixo 1
		"type" : item_type,
		"name" : item_name,
		"effect" : item_effect,
		"texture" : item_texture,
		"scene_path" : scene_path
	}
	if Global.player_node: #se a variavel player_node possuir um no (player)
		Global.addItem(item)
		geladeira.add_item_geladeira(item)
		self.queue_free() #remove o item em questão da cena

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		player_in_range = false
