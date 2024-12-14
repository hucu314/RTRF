extends SubViewport
@onready var camera = $Camera2D

func _physics_process(delta):
	if variables.sailing:
		camera.position = owner.find_child('shipPlayer').position
	if not variables.sailing:
		camera.position = owner.find_child('player').position
