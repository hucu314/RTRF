extends CharacterBody2D
@onready var player: AnimatedSprite2D = $player
@onready var clothes: AnimatedSprite2D = $clothes


const SPEED = 600.0


func _physics_process(delta: float) -> void:
	# Add the gravity.



	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xdirection := Input.get_axis("left", "right")
	var ydirection := Input.get_axis("up","down")
	if xdirection or ydirection:
		velocity.x = xdirection * SPEED
		velocity.y = ydirection * SPEED
		if xdirection == 0:
			player.play("idleLeft")
		if xdirection == 1:
			player.play("idleRight")
		if ydirection == 0:
			player.play("idleBack")
		if ydirection == 1:
			player.play("idleFront")
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
