extends CharacterBody2D
class_name Enemy

@onready var animation = $AnimatedSprite2D
var play = Player.new()
var speed = 50
var player_chase = false
var player = null
var resources = 30
var attack = 5

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
	if body is Player:
		player = body
		player_chase = true
		animation.play('fly')
		
			
	


func _on_detection_area_body_exited(body):
	if body is Player:
		print('notchasing')
		player = null
		player_chase = false
		animation.play('idle')
