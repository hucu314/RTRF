extends Camera2D
@onready var popup_menu: PopupMenu = $PopupMenu
@onready var label: Label = $Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = "Currency: " + str(variables.money)
	
	if variables.upgradeShip == true:
		#if Input.
		pass
	pass


func _on_popup_menu_index_pressed(index: int) -> void:
	print(index)
	pass # Replace with function body.
