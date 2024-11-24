extends CharacterBody2D

var target: Vector2
var direction: Vector2
const speed = 600


func _ready():
	direction = (target-global_position).normalized()
	var angle = rad_to_deg(self.global_position.angle_to_point(target))
	print(angle)
	rotation_degrees = angle
	
func _physics_process(delta: float) -> void:
	velocity = (direction*600)
	global_position += velocity * delta
	
