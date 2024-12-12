extends Control
class_name titlescreen

@onready var timer = $Timer
@onready var player = $player
@onready var ship_player = $shipPlayer
signal loadGame


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta):
	if variables.titleScreen == true:
		print('titleScreen')
		var start = get_tree().get_nodes_in_group("startscreen")
		for x in start:
			x.visible = true
		var load = get_tree().get_nodes_in_group("loadscreen")
		for x in load:
			x.visible = false
	elif variables.loadScreen == true:
		print('change')
		var start = get_tree().get_nodes_in_group("startscreen")
		for x in start:
			x.visible = false
		var load = get_tree().get_nodes_in_group("loadscreen")
		for x in load:
			x.visible = true


func _on_start_pressed() -> void:
	variables.loadScreen = true
	variables.titleScreen = false
	print('start')
	#var start = get_tree().get_nodes_in_group("startscreen")
	#for x in start:
	#	x.visible = false
	#var load = get_tree().get_nodes_in_group("loadscreen")
	#for x in load:
	#	x.visible = true
	#	print()
	#variables.load = true
	#get_tree().change_scene_to_file("res://Scenes/game.tscn")
	pass # Replace with function body.


func _on_game_save():
	pass # Replace with function body.


func _on_file_1_pressed():
	variables.saveNum = 1
	variables.load = true
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	pass # Replace with function body.


func _file_2_pressed():
	variables.saveNum = 2
	variables.load = true
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	pass # Replace with function body.


func _file_3_pressed():
	variables.saveNum = 3
	variables.load = true
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	pass # Replace with function body.
