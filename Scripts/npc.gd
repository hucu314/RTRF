extends CharacterBody2D
class_name NPC

@onready var dialogue: ColorRect = $ColorRect



func _physics_process(delta: float) -> void:
	if variables.talk == true:
		dialogue.visible = true
	else:
		dialogue.visible = false
	pass

func _on_dialogue_body_entered(body: Node2D) -> void:
	print(body)
	if body is Player:
		variables.talkable = true
	pass # Replace with function body.


func _on_dialogue_body_exited(body: Node2D) -> void:
	if body is Player:
		variables.talkable = false
		variables.talk = false
	pass # Replace with function body.
