extends CharacterBody2D

@export var speed:int = 100

@onready var animation = $AnimationPlayer
#@onready var inventory_ui = $inventory_ui

func _ready():
	Global.set_player_reference(self)

func getInput():
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed


func chooseAnimation():
	if velocity.length() == 0:
		if animation.is_playing():
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
	
#func _input(event):
	#if event.is_action_pressed("ui_inventory"):
		#print_debug("aqui")
		#inventory_ui.visible = !inventory_ui.visible
		#get_tree().paused = !get_tree().paused
		
