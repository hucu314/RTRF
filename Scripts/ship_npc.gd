extends NPC

@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	dialogue = color_rect

func _on_dialogue_body_entered(body: Node2D) -> void:
	if body is Player:
		variables.talkable = true
	pass # Replace with function body.


func _on_dialogue_body_exited(body: Node2D) -> void:
	if body is Player:
		variables.talkable = false
		variables.talk = false
	pass # Replace with function body.
