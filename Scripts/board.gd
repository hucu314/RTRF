extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	if body.name == 'player':
		print('can board')
		variables.canBoard = true
	if body.name == 'shipPlayer':
		variables.canLeave = true
	variables.board = self.name
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == 'player':
		variables.canBoard = false
	if body.name == 'shipPlayer':
		variables.canLeave = false
	variables.board = self.name
	pass # Replace with function body.
