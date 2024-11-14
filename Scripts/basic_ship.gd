extends CharacterBody2D
@onready var sail: AnimatedSprite2D = $sail
@onready var rightWaves: AnimatedSprite2D = $"Right Waves"
@onready var leftWaves: AnimatedSprite2D = $"Left Waves"
@onready var ship = $ship
@onready var totalHealth: float = 100
@onready var health: float = 100





const SPEED = 300.0
@onready var isAttacking = false
var durability = health/totalHealth
func _physics_process(delta: float) -> void:
	if variables.sailing == true:	
		# Add the gravity.
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
	if damaged > 50:
		sail.play(str(movement))
		leftWaves.play(str(movement))
		rightWaves.play(str(movement))
		ship.play('notDamaged')
		sail.play('notDamaged')
		ship.play('notDamaged')
	if damaged > 0:
		sail.play(str(movement))
		ship.play(str(damaged))
		ship.play('damaged')
		sail.play('damaged')
		ship.play('damaged')
	if damaged <= 0:
		sail.play('destroyed')
		
	
	
	
func dirAnimation(dir:Vector2):
	if dir.x == -1 and dir.y == 0:
		self.rotation_degrees = 90
	if dir.x == 1 and dir.y == 0:
		self.rotation_degrees = 270
	if dir.x == 0 and dir.y == -1:
		self.rotation_degrees = 180
	if dir.x == 0 and dir.y == 1:
		self.rotation_degrees = 0
