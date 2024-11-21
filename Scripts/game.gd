extends Node2D
@onready var camera = $camera
@onready var ship = $basicShip
@onready var player = $player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed('switchWeapon'):
		if player.weapon == 'sword':
			player.weapon = 'gun'
		elif player.weapon == 'gun':
			player.weapon = 'sword'
	if Input.is_action_just_pressed('takeDamage'):
		ship.health -= 10
	if variables.canBoard == true and variables.sailing == false or variables.canLeave == true and variables.sailing == true:
		if Input.is_action_just_pressed('switch'):
			if variables.sailing == false:
				variables.sailing = true
			else:
				variables.sailing = false
	trackPlayer()
	
	#camera following

	pass

func trackPlayer():
	if variables.sailing == true:
		camera.position = ship.position
	elif variables.sailing == false:
		camera.position = player.position

func _on_board_body_entered(body):
	if body.name == 'player':
		variables.canBoard = true
	if body.name == 'basicShip':
		variables.canLeave = true
	pass # Replace with function body.


func _on_board_body_exited(body):
	if body.name == 'player':
		variables.canBoard = false
	if body.name == 'basicShip':
		variables.canLeave = false
	pass # Replace with function body.
