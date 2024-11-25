extends Node2D
@onready var camera = $camera
@onready var ship = $shipPlayer
@onready var player = $player
@onready var shipHealthBar: ProgressBar = $camera/shipHealth
@onready var shipHealthColor = $camera/shipHealth.get_theme_stylebox('fill')
@onready var playerHealthBar: ProgressBar = $camera/playerHealth
@onready var playerHealthColor = $camera/playerHealth.get_theme_stylebox('fill')


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#updates health bar for boat
	updateBoatHealth()
	
	#Switch Weapon
	if Input.is_action_just_pressed('switchWeapon'):
		if player.weapon == 'sword':
			player.weapon = 'gun'
		elif player.weapon == 'gun':
			player.weapon = 'sword'
			
			
	#Boat takes damge (testing purposes only)
	if Input.is_action_just_pressed('takeDamage'):
		ship.health -= 10
		
		
		
	#allows for baording and exiting of the ship (testing purposes only)
	if variables.canBoard == true and variables.sailing == false or variables.canLeave == true and variables.sailing == true:
		if Input.is_action_just_pressed('switch'):
			if variables.sailing == false:
				variables.sailing = true
			else:
				variables.sailing = false
				
	#player/ship camera tracker
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
	if body.name == 'shipPlayer':
		variables.canLeave = true
	pass # Replace with function body.


func _on_board_body_exited(body):
	if body.name == 'player':
		variables.canBoard = false
	if body.name == 'shipPlayer':
		variables.canLeave = false
	pass # Replace with function body.
	
	
func updateBoatHealth():
	shipHealthBar.value = ship.durability
	if ship.durability>60:
		shipHealthColor.set_bg_color(Color('3fff25'))
	elif ship.durability>30:
		shipHealthColor.set_bg_color(Color("f8ff1d"))
	elif ship.durability>0:
		shipHealthColor.set_bg_color(Color("FF0000"))
