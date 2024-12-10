extends Control


func _on_save_and_leave_pressed():
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
	pass # Replace with function body.


func _on_continue_pressed():
	visible = false
	pass # Replace with function body.
