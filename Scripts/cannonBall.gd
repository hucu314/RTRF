extends Ammo
var explode = false
@onready var animation = $AnimatedSprite2d
# Called when the node enters the scene tree for the first time.
func _ready():
	speed = 200
	
	print(speed)
	
	direction = (target-global_position).normalized()
	var angle = rad_to_deg(self.global_position.angle_to_point(target))
	rotation_degrees = angle
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_animated_sprite_2d_animation_finished():
	if explode == true:
		queue_free()
	pass # Replace with function body.


func enterBody(body):
	if body is Player:
		explode = true
		animation.play("explosion")
	pass # Replace with function body.
