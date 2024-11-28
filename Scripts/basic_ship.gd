extends CharacterBody2D
class_name Ship

@onready var sail: AnimatedSprite2D = $sail
@onready var rightWaves: AnimatedSprite2D = $"Right Waves"
@onready var leftWaves: AnimatedSprite2D = $"Left Waves"
@onready var ship = $ship
@onready var totalHealth: float = 100
@onready var health: float = 100
@onready var stick = $stick
@onready var isEditable = false
var SPEED = 150.0
@onready var isAttacking = false
@onready var menu = $PopupMenu
@onready var durability = (health/totalHealth)*100
const shipCrosshair = preload("res://Assets/ELR_Crosshairs/shipCrosshair.png")
var dirAnim = 'none'

#change this
const ammo = preload("res://Scenes/Ships/cannon_ball.tscn")
var bulletLocation: Vector2
@onready var bullets: Node = $"../bullets"
@onready var testBlocks: Node = $"../testBlocks"

func _ready():
	pass

func _physics_process(delta: float) -> void:
	durability = (health/totalHealth)*100
	shipMenu()
	

	
	if menu.visible == true:
		variables.inMenu = true
	else:
		variables.inMenu = false
	
	if variables.sailing == true:	
	
		#changes cursor for ship
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(shipCrosshair,Input.CURSOR_ARROW,Vector2(28,28))
	
		# ship movement.
		isEditable = true
		var xdirection := Input.get_axis("left", "right")
		var ydirection := Input.get_axis("up","down")
		
		var direction = Vector2(xdirection,ydirection)
		dirAnimation(direction)
		if direction:
			velocity.x = direction.x * SPEED
			velocity.y = direction.y * SPEED
			changeAnim('sailing',durability)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.y = move_toward(velocity.y, 0, SPEED)
			changeAnim('idle',durability)
		if Input.is_action_just_pressed('attack') and not variables.inMenu:
			print('fire')
			fireCannon(get_local_mouse_position())
		move_and_slide()
		
#changes animation for movement
func changeAnim(movement,damaged):
	leftWaves.play(str(movement))
	rightWaves.play(str(movement))
	if damaged > 50:
		sail.play(str(movement))	
		ship.play('notDamaged')
		stick.play('notDamaged')
	elif damaged > 0:
		sail.play(str(movement))	
		ship.play('damaged')
		stick.play('notDamaged')
	elif damaged <= 0:
		sail.play('damaged')	
		sail.play('destroyed')
		stick.play('destroyed')
		ship.play('destroyed')
		
	
func shipMenu():
	if Input.is_action_just_pressed('interact') and isEditable:
		menu.visible = true
	if Input.is_action_just_pressed('exit') or isEditable == false:
		menu.visible = false
		
	
	
func dirAnimation(dir:Vector2):
	if dir.x == -1 and dir.y == 0:
		self.rotation_degrees = 90
	if dir.x == 1 and dir.y == 0:
		self.rotation_degrees = 270
	if dir.x == 0 and dir.y == -1:
		self.rotation_degrees = 180
	if dir.x == 0 and dir.y == 1:
		self.rotation_degrees = 0


func fireCannon(target):
	var mousePosition = get_local_mouse_position()
	#if mousePosition.x > 100 or mousePosition.x < -100 or mousePosition.y > 100 or mousePosition.y < -100:
	isAttacking = true
	print(target)
	cannonDir(mousePosition)
	var bullet = ammo.instantiate()
	bullet.global_position = bulletLocation
	bullet.target = get_global_mouse_position()
	bullets.add_child(bullet)
	pass


func cannonDir(dir:Vector2):
	#Left
	if dir.x < -3.125 and dir.y < 62.5 and dir.y > -62.5:
		dirAnim = 'Left'
		bulletLocation = global_position + Vector2(-9.625,2.625)
	#Right
	elif dir.x > 3.125 and dir.y < 62.5 and dir.y > -62.5:
		dirAnim = 'Right'
		bulletLocation = global_position + Vector2(9.625,2.625)
	#Up
	elif dir.y < 0:
		dirAnim = 'Up'
		bulletLocation = global_position + Vector2(6.875,-4.5)
	#Down
	elif dir.y > 0:
		dirAnim = 'Down'
		bulletLocation = global_position + Vector2(-6.875,10)



func _on_interactArea_entered(body):
	if not variables.sailing:
		if body is Player:
			isEditable = true
			


func _on_interactArea_exited(body):
	if not variables.sailing:
		if body is Player:
			isEditable = false




func _on_popup_menu_id_pressed(id: int) -> void:
	if id == 0:
		health += 10
	pass # Replace with function body.
