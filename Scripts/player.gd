extends CharacterBody2D
@onready var player: AnimatedSprite2D = $player
@onready var clothes: AnimatedSprite2D = $clothes
@onready var last_position: Vector2
@onready var dir
const SPEED = 600.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	#dirAnimation(global_position-last_position)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xdirection := Input.get_axis("left", "right")
	var ydirection := Input.get_axis("up","down")
	print(xdirection)
	print(ydirection)
	playDir(xdirection,ydirection)
	print(dir)
	if xdirection or ydirection:
		velocity.x = xdirection * SPEED
		velocity.y = ydirection * SPEED
		changeAnim('move',dir)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		changeAnim('idle',dir)
	move_and_slide()

func changeAnim(movement,direction):
	player.play(str(movement)+str(direction))
	clothes.play(str(movement)+str(direction))

func playDir(x,y):
	print(x)
	print(y)
	if x<0 and y == 0:
		dir = 'Left'
	if x>0 and y == 0:
		dir = 'Right'
	if x==0 and y < 0:
		dir = 'Up'
	if x==0 and y > 0:
		dir = 'Down'
