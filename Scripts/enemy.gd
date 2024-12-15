extends CharacterBody2D
@onready var animation = $AnimatedSprite2D
var play = Player.new()
var speed = 50
var player_chase = false
var player = null
var resources = 30

func _physics_process(delta):
	if player_chase:
		position += (player.position - position)/speed
		if player.position.x > self.global_position.x:
			animation.flip_h = false
		elif player.position.x < self.global_position.x:
			animation.flip_h = true
	else:
		animation.play('idle')



func _on_detection_area_body_entered(body):
	print(body)
	if body is Player:
		print('chasing')
		player = body
		player_chase = true
		animation.play('fly')
		player.takeDamage(5)
		
			
	


func _on_detection_area_body_exited(body):
	if body is Player:
		print('notchasing')
		player = null
		player_chase = false
		animation.play('idle')
