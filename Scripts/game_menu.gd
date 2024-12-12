extends Control
signal saveGame
@onready var timer = $"../loading/Timer"
@onready var loadTimer = $Timer

func _on_save_and_leave_pressed():
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
	emit_signal('saveGame')
	#game.save()
	pass # Replace with function body.


func _on_continue_pressed():
	visible = false
	pass # Replace with function body.


func _on_timer_timeout():
	pass # Replace with function body.


func _on_load_pressed():
	emit_signal('saveGame')
	variables.loadScreen = true
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
	pass # Replace with function body.
