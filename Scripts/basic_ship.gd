extends CharacterBody2D
@onready var sail: AnimatedSprite2D = $sail
@onready var rightWaves: AnimatedSprite2D = $"Right Waves"
@onready var leftWaves: AnimatedSprite2D = $"Left Waves"
@onready var ship = $ship
@onready var totalHealth: float = 100
@onready var health: float = 100
@onready var stick = $stick
@onready var isEditable = false
const SPEED = 300.0
@onready var isAttacking = false
@onready var menu = $PopupMenu

func _ready():
	isEditable = false

func _physics_process(delta: float) -> void:
	var durability = (health/totalHealth)*100
	shipMenu()
	
	if variables.sailing == true:	
		# Add the gravity.
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


func _on_interactArea_entered(body):
	if not variables.sailing:
		if body is Player:
			isEditable = true


func _on_interactArea_exited(body):
	if not variables.sailing:
		if body is Player:
			isEditable = false
