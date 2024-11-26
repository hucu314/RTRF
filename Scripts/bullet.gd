extends CharacterBody2D
class_name Ammo

var target: Vector2
var direction: Vector2
var speed = 75


func _ready():
	
	
	print(speed)
	
	direction = (target-global_position).normalized()
	var angle = rad_to_deg(self.global_position.angle_to_point(target))
	print(angle)
	rotation_degrees = angle
	
func _physics_process(delta: float) -> void:
	velocity = (direction*speed)
	global_position += velocity * delta
