extends KinematicBody2D

var direction = Vector2(0, 0)

func changeMovement(x, y):
	direction.x += x
	direction.y += y
	
func _process(delta):
	var lastPos = position
	position += delta * global.playerSpeed * direction
	if (position.x < 80 or position.x > 1200):
		position = lastPos
