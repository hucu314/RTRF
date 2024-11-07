extends CharacterBody2D
@onready var player: AnimatedSprite2D = $player
@onready var clothes: AnimatedSprite2D = $clothes
@onready var last_position: Vector2

const SPEED = 600.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	dirAnimation(global_position-last_position)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xdirection := Input.get_axis("left", "right")
	var ydirection := Input.get_axis("up","down")
	print(xdirection)
	print(ydirection)
	if xdirection or ydirection:
		velocity.x = xdirection * SPEED
		velocity.y = ydirection * SPEED
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

func dirAnimation(direction:Vector2):
	var move = 'none'
	if direction.x == 0 and direction.y == 0 :
		move = 'idle'
		if direction.x > 0 and direction.y == 0:
			player.set_animation(move+'Right')
		if direction.x < 0 and direction.y == 0:
			player.set_animation(move+'Left')
		if direction.x == 0 and direction.y > 0:
			player.set_animation(move+'Front')
		if direction.x == 0 and direction.y < 0:
			player.set_animation(move+'Back')
	else:
		move = 'move' 
		if direction.x > 0 and direction.y == 0:
			player.set_animation(move+'Right')
		if direction.x < 0 and direction.y == 0:
			player.set_animation(move+'Left')
		if direction.x == 0 and direction.y > 0:
			player.set_animation(move+'Front')
		if direction.x == 0 and direction.y < 0:
			player.set_animation(move+'Back')
func dirAnimation(direction:Vector2):
	print(direction)
	if direction.x > 0 and direction.y == 0:
		return 'Right'
	if direction.x < 0 and direction.y == 0:
		return 'Left'
	if direction.x == 0 and direction.y > 0:
		return 'Front'
	if direction.x == 0 and direction.y < 0:
		return 'Right'
	move_and_slide()
