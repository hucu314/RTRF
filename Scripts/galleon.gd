extends Ship

func _ready():
	totalHealth = float(1000)
	health = float(1000)
	SPEED = 100


func _on_area_2d_body_entered(body):
	if not variables.sailing:
		if body is Player:
			isEditable = true
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if not variables.sailing:
		if body is Player:
			isEditable = false
	pass # Replace with function body.
	

func _on_popup_menu_id_pressed(id: int) -> void:
	if id == 0:
		health += 10
	pass # Replace with function body.
