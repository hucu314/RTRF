extends CharacterBody2D
class_name Player

@onready var player: AnimatedSprite2D = $player
@onready var clothes: AnimatedSprite2D = $clothes
@onready var last_position: Vector2
@onready var dirAnim = 'none'
@onready var isAttacking = false
const _SPEED = 150.0
@onready var _health: float = 100
@onready var _totalHealth: float = 100
@onready var playerHealth = (_health/_totalHealth)*100
@onready var resources
@onready var weapon = 'sword'
const gunCrosshair = preload('res://Assets/ELR_Crosshairs/gunCrosshair.png')
const ammo = preload('res://Scenes/bullet.tscn')
var bulletLocation: Vector2
@onready var bullets: Node = $"../bullets"
@onready var testBlocks: Node = $"../testBlocks"
@export var inventory: Inventory
var enemy = null
@onready var attackbox: Area2D = $attackbox

func _ready():
	resources = 10

func _physics_process(delta: float) -> void:
	playerHealth = (_health/_totalHealth)*100
	#print(global_position)
	# Add the gravity.
#	dirAnimation(global_position-last_position)
	if weapon == 'gun':
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(gunCrosshair,Input.CURSOR_ARROW,Vector2(28,28))
	if weapon == 'sword':
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_just_pressed('talk'):
		print('talk')
		talk()
	
	if variables.sailing == false:
		
		var xdirection := Input.get_axis("left", "right")
		var ydirection := Input.get_axis("up","down")
		
		var direction = Vector2(xdirection,ydirection)
		_dirAnimation(direction)
		#if isAttacking == false:
		if direction:
			velocity.x = direction.x * _SPEED
			velocity.y = direction.y * _SPEED
			if not isAttacking:
				changeAnim('move',dirAnim)
		else:
			velocity.x = move_toward(velocity.x, 0, _SPEED)
			velocity.y = move_toward(velocity.y, 0, _SPEED)
			if not isAttacking:
				changeAnim('idle',dirAnim)
		if Input.is_action_just_pressed('attack') and not variables.inMenu:
			if weapon == "gun":
				fireGun(get_local_mouse_position())
			elif weapon == 'sword':
				attack()
				swordAttack(dirAnim)
		move_and_slide()
	if player.is_playing() == false:
		isAttacking = false

			
			
func swordAttack(direction):
	isAttacking = true
	changeAnim('attack',direction)
	
func fireGun(direction):
	var mousePosition = get_local_mouse_position()
	if mousePosition.x >12.5 or mousePosition.x < -12.5 or mousePosition.y > 12.5 or mousePosition.y<12.5:
		isAttacking = true
		_gunDir(mousePosition)
		var bullet = ammo.instantiate()
		bullet.global_position = bulletLocation
		bullet.target = get_global_mouse_position()
		bullets.add_child(bullet)
		changeAnim("shoot","dirAnim")
	
func changeAnim(movement,direction):
	if direction == null or direction == "none":
		direction = "down"
	player.play(str(movement)+str(direction).capitalize())
	clothes.play(str(movement)+str(direction).capitalize())
	
func _dirAnimation(dir:Vector2):
	if dir.x < 0:
		dirAnim = 'Left'
		attackbox.rotation_degrees = 180
	elif dir.x > 0:
		dirAnim = 'Right'
		attackbox.rotation_degrees = 0
	elif dir.y < 0:
		dirAnim = 'Up'
		attackbox.rotation_degrees = 270
	elif dir.y > 0:
		dirAnim = 'Down'
		attackbox.rotation_degrees = 90
		
func _gunDir(dir:Vector2):
	if dir.x < -31.25 and dir.y < 62.5 and dir.y > -62.5:
		dirAnim = 'Left'
		bulletLocation = global_position + Vector2(-9.625,2.625)
	elif  dir.x >31.25 and dir.y <62.5 and dir.y >-62.5:
		dirAnim = 'Right'
		bulletLocation = global_position + Vector2(9.625,2.625)
	elif dir.y <0:
		dirAnim = "Up"
		bulletLocation = global_position + Vector2(9.625,-4.5)
	elif dir.y > 0:	
		dirAnim = 'Down'
		bulletLocation = global_position + Vector2(-9.625,10)
		

func _on_hurt_box_entered(area):
	if area.has_method("collect"):
		area.collect(inventory)

func takeDamage(damage):
	_health -= damage


func hitbox(body):
	if body is Enemy:
		takeDamage(body.attack)
	pass # Replace with function body.

func attack():
	if enemy is Enemy:
		if enemy:

			enemy.health -= 10




func attackboxexit(body: Node2D) -> void:
	if body is Enemy:
		enemy = null
	pass # Replace with function body.


func attackboxenter(body: Node2D) -> void:
	if body is Enemy:
		enemy = body
	pass # Replace with function body.
	
func talk():
	print('talk')
	if variables.talkable == true:
		variables.talk = true
