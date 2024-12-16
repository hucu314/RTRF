extends Node2D

@onready var camera = $camera
@onready var ship = $shipPlayer
@onready var player = $player
@onready var shipHealthBar: ProgressBar = $camera/shipHealth
@onready var shipHealthColor = $camera/shipHealth.get_theme_stylebox('fill')
@onready var playerHealthBar: ProgressBar = $camera/playerHealth
@onready var playerHealthColor = $camera/playerHealth.get_theme_stylebox('fill')
@onready var game_menu = $camera/gameMenu
const shipCrosshair = preload("res://Assets/ELR_Crosshairs/shipCrosshair.png")
@onready var loading = $camera/loading
var play = Player.new()
var config1 = ConfigFile.new()
var config2 = ConfigFile.new()
var config3 = ConfigFile.new()
@onready var menu: PopupMenu = $camera/PopupMenu
const two = preload("res://Scenes/Ships/Brigantine.tscn")
const three = preload("res://Scenes/Ships/Frigate.tscn")
const four = preload("res://Scenes/Ships/Galleon.tscn")
const five = preload("res://Scenes/Ships/ManOfWar.tscn")
const one = preload("res://Scenes/Ships/Sloop.tscn")
@onready var timer = $Timer

func _ready() -> void:
	
	pass # Replace with function body.


func load_game():
	if variables.saveNum == 1:
		var err = config1.load("res://savegame1.cfg")
		if err == OK:
			player.position.x = config1.get_value("player","x")
			player.position.y = config1.get_value("player","y")
			ship.position.x = config1.get_value("ship","x")
			ship.position.y = config1.get_value("ship","y")
	if variables.saveNum == 2:
		var err = config2.load("res://savegame2.cfg")
		if err == OK:
			player.position.x = config2.get_value("player","x")
			player.position.y = config2.get_value("player","y")
			ship.position.x = config2.get_value("ship","x")
			ship.position.y = config2.get_value("ship","y")
	if variables.saveNum == 3:
		var err = config3.load("res://savegame3.cfg")
		if err == OK:
			player.position.x = config3.get_value("player","x")
			player.position.y = config3.get_value("player","y")
			ship.position.x = config3.get_value("ship","x")
			ship.position.y = config3.get_value("ship","y")
	timer.start(400)
	pass
	
func save_game():
	if variables.saveNum == 1:
		config1.set_value('player','x',round(player.position.x))
		config1.set_value('player','y',round(player.position.y))
		config1.set_value('ship','x',round(ship.position.x))
		config1.set_value('ship','y',round(ship.position.y))
		config1.save('res://savegame1.cfg')
	elif variables.saveNum == 2:
		config2.set_value('player','x',round(player.position.x))
		config2.set_value('player','y',round(player.position.y))
		config2.set_value('ship','x',round(ship.position.x))
		config2.set_value('ship','y',round(ship.position.y))
		config2.save('res://savegame2.cfg')	
	elif variables.saveNum == 3:
		config3.set_value('player','x',round(player.position.x))
		config3.set_value('player','y',round(player.position.y))
		config3.set_value('ship','x',round(ship.position.x))
		config3.set_value('ship','y',round(ship.position.y))
		config3.save('res://savegame3.cfg')
		
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed('shop'):
		menu.visible = true
		variables.inMenu = true
	play.resources
	if variables.load == true:
		variables.load = false
		load_game()
	
	
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Input.set_custom_mouse_cursor(shipCrosshair,Input.CURSOR_ARROW,Vector2(28,28))
	if Input.is_action_just_pressed('exit'):
		game_menu.visible = true
			
		
	#updates health bar for boat
	updateBoatHealth()
	updatePlayerHealth()
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
				player.visible = false
			else:
				variables.sailing = false
				if variables.board == "board":
					player.visible = true
					player.global_position = Vector2(600,-68)
				elif variables.board == "board2":
					player.visible = true
					player.global_position = Vector2(1416, -1584)
					
					pass
				
	#player/ship camera tracker
	trackPlayer()
	
	#camera following

	pass

func trackPlayer():
	if variables.sailing == true:
		camera.position = ship.position
	elif variables.sailing == false:
		camera.position = player.position

	
	
func updateBoatHealth():
	shipHealthBar.value = ship.durability
	if ship.durability>60:
		shipHealthColor.set_bg_color(Color('3fff25'))
	elif ship.durability>30:
		shipHealthColor.set_bg_color(Color("f8ff1d"))
	elif ship.durability>0:
		shipHealthColor.set_bg_color(Color("FF0000"))
		
func updatePlayerHealth():
	playerHealthBar.value = player.playerHealth
	if player.playerHealth>60:
		playerHealthColor.set_bg_color(Color('3fff25'))
	elif player.playerHealth>30:
		playerHealthColor.set_bg_color(Color("f8ff1d"))
	elif player.playerHealth>0:
		playerHealthColor.set_bg_color(Color("FF0000"))


func _on_timer_timeout():
	loading.visible = false
	pass # Replace with function body.

func _on_inventory_gui_closed() -> void:
	get_tree().paused = false


func _on_inventory_gui_opened() -> void:
	get_tree().paused = true


func _on_popup_menu_id_pressed(id: int) -> void:
	if id == 0:
		var newShip = one.instantiate()
		newShip.global_position = ship.global_position 
		add_child(newShip)
	if id == 1:
		var newShip = two.instantiate()
		newShip.global_position = ship.global_position
		add_child(newShip)
	if id == 2:
		var newShip = three.instantiate()
		newShip.global_position = ship.global_position
		add_child(newShip)
	if id == 3:
		var newShip = four.instantiate()
		newShip.global_position = ship.global_position
		add_child(newShip)
	if id == 4:
		var newShip = five.instantiate()
		newShip.global_position = ship.global_position
		add_child(newShip) 
	pass # Replace with function body.
