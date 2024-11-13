extends CharacterBody2D
@onready var player: AnimatedSprite2D = $player
@onready var clothes: AnimatedSprite2D = $clothes
@onready var last_position: Vector2
@onready var dirAnim = 'none'
@onready var isAttacking = false
const SPEED = 600.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
#	dirAnimation(global_position-last_position)
	if variables.sailing == false:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		var xdirection := Input.get_axis("left", "right")
		var ydirection := Input.get_axis("up","down")
		
		var direction = Vector2(xdirection,ydirection)
		dirAnimation(direction)
		if isAttacking == false:
			if direction:
				velocity.x = direction.x * SPEED
				velocity.y = direction.y * SPEED
				changeAnim('move',dirAnim)
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
				velocity.y = move_toward(velocity.y, 0, SPEED)
				changeAnim('idle',dirAnim)
		if Input.is_action_just_pressed('use'):
			fireGun(dirAnim)
		if Input.is_action_just_pressed('shoot'):
			swordAttack(dirAnim)
		if player.is_playing() == false:
			isAttacking = false
func swordAttack(direction):
	isAttacking = true
	changeAnim('attack',direction)
func fireGun(direction):
	isAttacking = true
	changeAnim('shoot',direction)
func changeAnim(movement,direction):
	player.play(str(movement)+str(direction))
	clothes.play(str(movement)+str(direction))
func dirAnimation(dir:Vector2):
	if dir.x == -1 and dir.y == 0:
		dirAnim = 'Left'
	if dir.x == 1 and dir.y == 0:
		dirAnim = 'Right'
	if dir.x == 0 and dir.y == -1:
		dirAnim = 'Up'
	if dir.x == 0 and dir.y == 1:
		dirAnim = 'Down'
	move_and_slide()
